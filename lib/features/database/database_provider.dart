import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/features/database/tag_database.dart';
import 'package:snippet_code/features/home/model/tag_model.dart';
import 'package:snippet_code/features/home/repositories/tag_section/tag_db_repo.dart';

final dataBaseProvider = StateProvider<AppDatabase>((ref) {
  return AppDatabase();
});

final tagDatabaseProvider = Provider<TagDatabase>((ref) {
  final db = ref.watch(dataBaseProvider);
  return TagDatabase(db);
});

final tagDatabaseAllItemsProvider = FutureProvider<List<TagModel>>((ref) {
  final db = ref.watch(tagDatabaseProvider);
  return db.readItems();
});

final tagListStreamProvider = StreamProvider<List<TagModel>>((ref) {
  final db = ref.watch(tagDatabaseProvider);
  final stream = db.watchAllTags();
  stream.listen((data) {
    print('🔥 DB changed! New tags: $data');
  });
  return stream;
});

final addNewTag = Provider.family<void, TagModel>((ref, tag) {
  final db = ref.watch(tagDatabaseProvider);
  db.addNewItem(tag);
});

final deleteTag = Provider.family<void, TagModel>((ref, item) {
  final db = ref.watch(tagDatabaseProvider);
  db.deleteItem(item);
});

// TODO: fix updating ui , merge db with riverpod
