import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/features/database/database_provider.dart';
import 'package:snippet_code/features/home/model/tag_model.dart';

final tagTitleStateProvider = StateProvider<String>((ref) {
  return "title";
});

final tagColorStateProvider = StateProvider<Color>((ref) {
  return iconbg;
});

final tagListStateProvider = StateProvider<List<TagModel>>((ref) {
  return [];
});

final fetchTagListFromStream = Provider<List<TagModel>>((ref) {
  ref.listen(tagListStreamProvider, (perv, next) {
    next.whenData((tags) {
      ref.read(tagListStateProvider.notifier).state = tags;
    });
  });
  return [];
});

final searchInTagsProvider = Provider.family<List<TagModel>, String>((
  ref,
  input,
) {
  final tagList = ref.watch(tagListStateProvider);

  if (input.isEmpty) {
    return tagList;
  }

  return tagList.where((tag) {
    return tag.title.toLowerCase().contains(input.toLowerCase());
  }).toList();
});
