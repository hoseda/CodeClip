import 'package:drift/drift.dart';
import 'package:snippet_code/features/database/db_repository.dart';
import 'package:snippet_code/features/database/tag_database.dart';
import 'package:snippet_code/features/home/model/tag_model.dart';

class TagDatabase extends DatabaseRepository<TagModel> {
  //START, make this class singleton.
  static final TagDatabase _tagSingleton = TagDatabase._();
  factory TagDatabase.single() {
    return _tagSingleton;
  }
  TagDatabase._();
  // END,

  AppDatabase? database;
  TagDatabase({required this.database});

  @override
  Future addNewItem(TagModel item) async {
    await database!
        .into(database!.tagTable)
        .insert(
          TagTableCompanion.insert(
            id: Value(int.tryParse(item.id)!),
            title: item.title,
            color: item.color.toString(),
          ),
        );
  }

  @override
  Future deleteItem(TagModel item) async {
    // delete the given item from database.
    await database!
        .delete(database!.tagTable)
        .delete(
          TagTableCompanion.insert(
            id: Value(int.tryParse(item.id)!),
            title: item.id,
            color: item.color.toString(),
          ),
        );
  }

  @override
  Future updateItem(TagModel item) async {
    // replace the updated item.
    await database!
        .update(database!.tagTable)
        .replace(
          TagTableCompanion.insert(
            title: item.title,
            color: item.color.toString(),
          ),
        );
  }

  @override
  Future<List<TagModel>> readItems() async {
    //extract data from database
    final tagsData = await database!.select(database!.tagTable).get();
    // convet the data into list of Map
    final tagsJsonData = tagsData.map((t) => t.toJson()).toList();
    // convert the Map's into TagModel
    final tagsModelData = tagsJsonData.map((t) => TagModel.fromMap(t)).toList();
    return tagsModelData;
  }

  @override
  Future readItem(TagModel item) async {
    //extract all tags from database
    final tags = await readItems();
    return tags.where((t) => t.id == item.id).toList();
  }
}
