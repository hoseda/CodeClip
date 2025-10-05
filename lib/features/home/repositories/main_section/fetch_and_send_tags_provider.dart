import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedTagsCodePopUpProvider = StateProvider<Set<int>>((ref) {
  return {};
});

void clearSelectedTagsSet(WidgetRef ref) {
  ref.read(selectedTagsCodePopUpProvider.notifier).state = {};
}
