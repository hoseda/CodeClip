import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/core/constants/colors.dart';

final tagTitleStateProvider = StateProvider<String>((ref) {
  return "title";
});

final tagColorStateProvider = StateProvider<Color>((ref) {
  return iconbg;
});

final selectedTagIdsProvider = StateProvider<Set<int>>((ref) => {});
