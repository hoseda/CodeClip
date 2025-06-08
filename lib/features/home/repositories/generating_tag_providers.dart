import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/core/constants/colors.dart';
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


