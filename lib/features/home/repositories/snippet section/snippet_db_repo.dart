import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:snippet_code/features/database/app_database.dart';
import 'package:snippet_code/features/database/db_repository.dart';
import 'package:snippet_code/features/home/model/snippet_model.dart';

class SnippetDatabase extends DatabaseRepository<SnippetModel> {
  final AppDatabase database;
  static SnippetDatabase? _instance;

  factory SnippetDatabase(AppDatabase db) {
    _instance ??= SnippetDatabase._internal(db);
    return _instance!;
  }

  SnippetDatabase._internal(this.database);

  @override
  Future addNewItem(SnippetModel item) async {
    await database
        .into(database.snippetTable)
        .insert(
          SnippetTableCompanion(
            id: Value(item.id),
            title: Value(item.name),
            code: Value(item.code),
            tagsJson: Value(tagsToString(item.tags)),
            isLiked: Value(item.isLiked),
            isBookmarked: Value(item.isBookmarked),
          ),
        );
  }

  @override
  Future deleteItem(SnippetModel item) async {
    await (database.delete(database.snippetTable)
      ..where((t) => t.id.equals(item.id))).go();
  }

  @override
  Future readItem(SnippetModel item) async {
    final snippets =
        await (database.select(database.snippetTable)
          ..where((t) => t.id.equals(item.id))).getSingleOrNull();

    return snippets != null ? SnippetModel.fromMap(snippets.toJson()) : null;
  }

  @override
  Future<List<SnippetModel>> readItems() async {
    final snippetData = await database.select(database.snippetTable).get();
    return snippetData.map((t) {
      return SnippetModel(
        id: t.id,
        name: t.title,
        code: t.code,
        tags: stringToTags(t.tagsJson),
      );
    }).toList();
  }

  @override
  Future updateItem(SnippetModel item) async {
    await (database.update(database.snippetTable)
      ..where((t) => t.id.equals(item.id))).write(
      SnippetTableCompanion(
        title: Value(item.name),
        code: Value(item.code),
        tagsJson: Value(tagsToString(item.tags)),
        isLiked: Value(item.isLiked),
        isBookmarked: Value(item.isBookmarked),
      ),
    );
  }

  @override
  Stream<List<SnippetModel>> watchAllTags() {
    return (database.select(database.snippetTable)).watch().map(
      (rows) => rows.map((e) => SnippetModel.fromMap(e.toJson())).toList(),
    );
  }
}

String tagsToString(Set<int>? tags) {
  if (tags == null) return jsonEncode([]); // safe default
  return jsonEncode(tags.toList());
}

Set<int> stringToTags(String? source) {
  if (source == null || source.isEmpty) return {};
  try {
    final decoded = jsonDecode(source);
    if (decoded is List) {
      return decoded.map((e) => e as int).toSet();
    }
  } catch (e) {
    // ignore malformed JSON
  }
  return {};
}
