import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/core/utils/get_constrasting_color.dart';
import 'package:snippet_code/features/database/database_provider.dart';
import 'package:snippet_code/features/home/model/snippet_model.dart';
import 'package:snippet_code/features/home/model/tag_model.dart';
import 'package:snippet_code/features/home/repositories/snippet%20section/snippet_section_providers.dart';

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
          return Dismissible(
            key: ValueKey(snippet.id),
            direction: DismissDirection.endToStart,
            onDismissed: (_) {
              final newList = ref
                  .read(snippetListStateProvider)
                  .deleteSnippet(snippet.id);
              ref.read(snippetListStateProvider.notifier).state = [...newList];
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
                  Text(snippet.name, style: TextStyle(color: iconbg)),
                  const Spacer(),
                  IconButton(
                    icon:
                        snippet.isLiked
                            ? Icon(
                              Icons.favorite_rounded,
                              color: Colors.redAccent,
                            )
                            : Icon(
                              Icons.favorite_border_rounded,
                              color: iconbg,
                            ),
                    onPressed: () {
                      _toggleFavoriteButton(ref, snippet);
                    },
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon:
                        snippet.isBookmarked
                            ? Icon(
                              Icons.bookmarks_rounded,
                              color: Colors.blueAccent,
                            )
                            : Icon(
                              Icons.bookmark_border_rounded,
                              color: iconbg,
                            ),
                    onPressed: () {
                      _toggleBookMarkButton(ref, snippet);
                    },
                  ),
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

void _toggleFavoriteButton(WidgetRef ref, SnippetModel snippet) {
  final snippets = ref.read(snippetListStateProvider);
  final indexOfOldSnippet = snippets.indexOf(snippet);
  final newSnippet = snippet.likeSnippet(snippet);
  snippets[indexOfOldSnippet] = newSnippet;
  ref.read(snippetListStateProvider.notifier).state = [...snippets];
}

void _toggleBookMarkButton(WidgetRef ref, SnippetModel snippet) {
  final snippets = ref.read(snippetListStateProvider);
  final indexOfOldSnippet = snippets.indexOf(snippet);
  final newSnippet = snippet.bookMarkSnippet(snippet);
  snippets[indexOfOldSnippet] = newSnippet;
  ref.read(snippetListStateProvider.notifier).state = [...snippets];
}
