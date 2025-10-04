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
  final repo = ref.watch(tagDatabaseProvider);
  return repo.watchAllTags();
});

final addNewTag = Provider.family<void, TagModel>((ref, tag) {
  final db = ref.watch(tagDatabaseProvider);
  db.addNewItem(tag);
});


// TODO: fix updating ui , merge db with riverpod