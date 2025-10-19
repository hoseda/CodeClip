import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/features/database/app_database.dart';
import 'package:snippet_code/features/editor/repository/code_editor_providers.dart';
import 'package:snippet_code/features/home/model/snippet_model.dart';
import 'package:snippet_code/features/home/model/tag_model.dart';
import 'package:snippet_code/features/home/repositories/snippet%20section/snippet_db_repo.dart';
import 'package:snippet_code/features/home/repositories/snippet%20section/snippet_section_providers.dart';
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
  return stream;
});

final addNewTag = Provider.family<void, TagModel>((ref, tag) {
  final db = ref.watch(tagDatabaseProvider);
  db.addNewItem(tag);
});

final deleteTag = FutureProvider.family<void, TagModel>((ref, item) async {
  final db = ref.watch(tagDatabaseProvider);
  try {
    await db.deleteIfAllowedItem(item);
  } catch (e) {
    rethrow;
  }
});

final updateTag = Provider.family<void, TagModel>((ref, item) {
  final db = ref.watch(tagDatabaseProvider);
  db.updateItem(item);
});

final snippetDatabaseProvider = Provider<SnippetDatabase>((ref) {
  final db = ref.watch(dataBaseProvider);
  return SnippetDatabase(db);
});

final snippetDatabseAllItemsProvider = FutureProvider<List<SnippetModel>>((
  ref,
) {
  final db = ref.watch(snippetDatabaseProvider);
  return db.readItems();
});

final snippeWithTagstListStreamProvider =
    StreamProvider.autoDispose<List<SnippetModel>>((ref) {
      final db = ref.watch(snippetDatabaseProvider);
      return db.watchSnippetsWithTags();
    });

final addNewSnippet = Provider.family<void, SnippetModel>((ref, item) {
  final db = ref.watch(snippetDatabaseProvider);
  db.addNewItem(item, item.tagsId);
});

final softDeleteSnippet = FutureProvider.family<void, SnippetModel>((
  ref,
  item,
) async {
  final db = ref.watch(snippetDatabaseProvider);
  await db.softDeleteItem(item);

  final selected = ref.read(tappedSnippetStateProvider);
  if (selected?.id == item.id) {
    ref.read(tappedSnippetStateProvider.notifier).state = null;
    ref.read(codeEditorController)!.clear();
  }
});

final deleteSnippet = FutureProvider.family<void, SnippetModel>((
  ref,
  item,
) async {
  final db = ref.watch(snippetDatabaseProvider);
  await db.deleteItem(item);

  final selected = ref.read(tappedSnippetStateProvider);
  if (selected?.id == item.id) {
    ref.read(tappedSnippetStateProvider.notifier).state = null;
    ref.read(codeEditorController)!.clear();
  }
});

final updateSnippet = Provider.family<void, SnippetModel>((ref, item) {
  final db = ref.watch(snippetDatabaseProvider);
  db.updateItem(item);
});
