import 'package:drift/drift.dart';
import 'package:snippet_code/features/database/app_database.dart';
import 'package:snippet_code/features/home/model/snippet_model.dart';

class SnippetDatabase {
  final AppDatabase database;
  static SnippetDatabase? _instance;

  factory SnippetDatabase(AppDatabase database) {
    _instance ??= SnippetDatabase._internal(database);
    return _instance!;
  }

  SnippetDatabase._internal(this.database);

  Future<int> addNewItem(SnippetModel item, Set<int> tagsId) async {
    return database.transaction(() async {
      final snippetId = await database
          .into(database.snippetTable)
          .insert(
            SnippetTableCompanion(
              title: Value(item.name),
              code: Value(item.code),
              isLiked: Value(item.isLiked),
              isBookmarked: Value(item.isBookmarked),
              isDeleted: Value(item.isDeleted),
            ),
          );

      for (var tagId in tagsId) {
        await database
            .into(database.snippetTagTable)
            .insert(
              SnippetTagTableCompanion(
                tagId: Value(tagId),
                snippetId: Value(snippetId),
              ),
            );
      }
      return snippetId;
    });
  }

  Future deleteItem(SnippetModel item) async {
    final newItem = item.copyWith(isDeleted: true);
    await updateItem(newItem);
  }

  Future readItem(SnippetModel item) async {
    final snippets =
        await (database.select(database.snippetTable)
          ..where((t) => t.id.equals(item.id))).getSingleOrNull();

    return snippets != null ? SnippetModel.fromMap(snippets.toJson()) : null;
  }

  Future<List<SnippetModel>> readItems() async {
    final snippetData = await database.select(database.snippetTable).get();
    return snippetData.map((t) {
      return SnippetModel(
        id: t.id,
        name: t.title,
        code: t.code,
        isLiked: t.isLiked,
        isBookmarked: t.isBookmarked,
        isDeleted: t.isDeleted,
      );
    }).toList();
  }

  Future updateItem(SnippetModel item) async {
    await (database.update(database.snippetTable)
      ..where((t) => t.id.equals(item.id))).write(
      SnippetTableCompanion(
        title: Value(item.name),
        code: Value(item.code),
        isLiked: Value(item.isLiked),
        isBookmarked: Value(item.isBookmarked),
        isDeleted: Value(item.isDeleted),
      ),
    );
  }

  Stream<List<SnippetModel>> watchAllTags() {
    return (database.select(database.snippetTable)).watch().map(
      (rows) => rows.map((e) => SnippetModel.fromMap(e.toJson())).toList(),
    );
  }

  Stream<List<SnippetModel>> watchSnippetsWithTags() {
    final snippetQuery = (database.select(database.snippetTable)
      ..orderBy([(t) => OrderingTerm.asc(t.title)])).join([
      leftOuterJoin(
        database.snippetTagTable,
        database.snippetTagTable.snippetId.equalsExp(database.snippetTable.id),
      ),
      leftOuterJoin(
        database.tagTable,
        database.tagTable.id.equalsExp(database.snippetTagTable.tagId),
      ),
    ]);

    return snippetQuery.watch().map((rows) {
      final Map<int, SnippetModel> snippets = {};

      for (var row in rows) {
        final snippet = row.readTable(database.snippetTable);
        final tag = row.readTableOrNull(database.tagTable);

        snippets.putIfAbsent(
          snippet.id,
          () => SnippetModel(
            id: snippet.id,
            name: snippet.title,
            code: snippet.code,
            isLiked: snippet.isLiked,
            isBookmarked: snippet.isBookmarked,
            isDeleted: snippet.isDeleted,
            tagsId: {},
          ),
        );

        if (tag != null) {
          snippets[snippet.id]!.tagsId.add(tag.id);
        }
      }
      return snippets.values.toList();
    });
  }
}
