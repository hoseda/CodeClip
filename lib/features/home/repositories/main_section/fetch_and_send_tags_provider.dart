import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/features/home/model/tag_model.dart';

final selectedTagsProvider = StateProvider.family<List<TagModel>, TagModel>((
  ref,
  input,
) {
  return [];
});
