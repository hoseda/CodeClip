import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/core/constants/colors.dart';
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
        trailing: Wrap(
          spacing: 4,
          runSpacing: 4,
          children:
              filteredTags.map((t) => generateTagForSnippetCode(t)).toList(),
        ),
      );
    },
    error: (error, stackTrace) => Text("Error : $error"),
    loading: () => const CircularProgressIndicator(),
  );
}

Widget generateTagForSnippetCode(TagModel tag) {
  return FilterChip(
    label: Text(
      tag.title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    onSelected: (v) {},
    color: WidgetStatePropertyAll(tag.color),
    selectedColor: tag.color,
    selected: false,
    onDeleted: null,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.compact,
    side: BorderSide(color: Colors.transparent),
  );
}
