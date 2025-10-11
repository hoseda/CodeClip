import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/highlight_core.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/core/utils/get_constrasting_color.dart';
import 'package:snippet_code/features/database/database_provider.dart';
import 'package:snippet_code/features/home/model/snippet_model.dart';
import 'package:snippet_code/features/home/model/tag_model.dart';

Widget generateSnippetCode(WidgetRef ref, SnippetModel snippet) {
  final availableTags = ref.watch(tagListStreamProvider);
  return availableTags.when(
    data: (tags) {
      final filteredTags =
          tags.where((tag) => snippet.tags.contains(tag.id)).toList();
      return ListTile(
        title: Text(snippet.name, style: TextStyle(color: iconbg)),
        subtitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                filteredTags.map((t) => generateTagForSnippetCode(t)).toList(),
          ),
        ),
      );
    },
    error: (error, stackTrace) => Text("Error : $error"),
    loading: () => const CircularProgressIndicator(),
  );
}

Widget generateTagForSnippetCode(TagModel tag) {
  return Chip(
    label: Text(tag.title),
    backgroundColor: tag.color,
    labelStyle: TextStyle(
      color: getContrastingTextColor(tag.color),
      fontSize: 12,
    ),
  );
}

//TODO : use code language detector here.
