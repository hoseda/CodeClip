import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/features/home/model/tag_model.dart';

final selectedTagsProvider = StateProvider<Set<TagModel>>((ref) {
  return {};
});

void addToSelectedTags(WidgetRef ref, TagModel tag) {
  Set<TagModel> tags = ref.read(selectedTagsProvider);
  ref.read(selectedTagsProvider.notifier).state = {...tags, tag};
}

void removeSelectedTags(WidgetRef ref, TagModel tag) {
  final Set<TagModel> tags = ref.read(selectedTagsProvider);
  final updated = {...tags}..remove(tag);
  ref.read(selectedTagsProvider.notifier).state = updated;
}

bool isTagSelected(WidgetRef ref, TagModel tag) {
  Set<TagModel> tags = ref.read(selectedTagsProvider);
  return tags.contains(tag);
}

void clearSelectedTagsSet(WidgetRef ref) {
  ref.read(selectedTagsProvider.notifier).state = {};
}
