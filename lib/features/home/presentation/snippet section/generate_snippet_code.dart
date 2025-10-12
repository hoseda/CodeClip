import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: filteredTags.length,
        itemBuilder: (context, index) {
          final snippet = filteredTags[index];
          return Dismissible(
            key: ValueKey(snippet.id),
            direction: DismissDirection.endToStart,
            onDismissed: (_) {
              // TODO: implement delete logic .
            },
            background: Container(
              color: backgound,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.delete, color: iconbg, size: 24),
                  const SizedBox(width: 15),
                ],
              ),
            ),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(snippet.title, style: TextStyle(color: iconbg)),
                  const Spacer(),
                  Icon(Icons.favorite_border_rounded, color: iconbg),
                  const SizedBox(width: 8),
                  Icon(Icons.bookmark_border_rounded, color: iconbg),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      filteredTags
                          .map((t) => generateTagForSnippetCode(t))
                          .toList(),
                ),
              ),
            ),
          );
        },
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
