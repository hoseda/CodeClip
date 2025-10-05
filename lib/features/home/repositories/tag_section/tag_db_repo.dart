import 'package:drift/drift.dart';
import 'package:snippet_code/features/database/db_repository.dart';
import 'package:snippet_code/features/database/tag_database.dart';
import 'package:snippet_code/features/home/model/tag_model.dart';

class TagDatabase extends DatabaseRepository<TagModel> {
  final AppDatabase database;
  static TagDatabase? _instance;

  factory TagDatabase(AppDatabase db) {
    _instance ??= TagDatabase._internal(db);
    return _instance!;
  }

  TagDatabase._internal(this.database);

  @override
  Future addNewItem(TagModel item) async {
    await database
        .into(database.tagTable)
        .insert(
          TagTableCompanion.insert(
            id: Value(item.id),
            title: item.title,
            color: colorToHex(item.color),
          ),
        );
  }

  @override
  Future deleteItem(TagModel item) async {
    // delete the given item from database.
    await (database.delete(database.tagTable)
      ..where((t) => t.id.equals(item.id))).go();
  }

  @override
  Future updateItem(TagModel item) async {
    // replace the updated item.
    await (database.update(database.tagTable)
      ..where((t) => t.id.equals(item.id))).write(
      TagTableCompanion(
        title: Value(item.title),
        color: Value(colorToHex(item.color)),
      ),
    );
  }

  @override
  Future<List<TagModel>> readItems() async {
    //extract data from database
    final tagsData = await database.select(database.tagTable).get();
    return tagsData.map((t) {
      return TagModel(id: t.id, title: t.title, color: colorFormHex(t.color));
    }).toList();
  }

  @override
  Future readItem(TagModel item) async {
    //extract all tags from database
    final tags =
        await (database.select(database.tagTable)
          ..where((t) => t.id.equals(item.id))).getSingleOrNull();
    return tags != null ? TagModel.fromMap(tags.toJson()) : null;
  }

  @override
  Stream<List<TagModel>> watchAllTags() {
    return (database.select(database.tagTable)).watch().map(
      (rows) => rows.map((t) => TagModel.fromMap(t.toJson())).toList(),
    );
  }
}
