import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/core/utils/get_constrasting_color.dart';
import 'package:snippet_code/features/database/database_provider.dart';
import 'package:snippet_code/features/editor/repository/code_editor_providers.dart';
import 'package:snippet_code/features/home/model/menu_item_model.dart';
import 'package:snippet_code/features/home/model/snippet_model.dart';
import 'package:snippet_code/features/home/model/tag_model.dart';
import 'package:snippet_code/features/home/repositories/item%20section/item_secrion_repo.dart';
import 'package:snippet_code/features/home/repositories/snippet%20section/snippet_section_providers.dart';

Widget generateSnippetCode(WidgetRef ref, SnippetModel snippet) {
  final allTags = ref.watch(tagListStreamProvider);
  final mode = ref.watch(selectedMenuItemStateProvider);
  final isSnippetSelected = ref.watch(tappedSnippetStateProvider);
  return allTags.when(
    data: (data) {
      final filteredTags =
          data.where((t) => snippet.tagsId.contains(t.id)).toList();

      return Dismissible(
        key: ValueKey(snippet.id),
        direction:
            mode != ItemModel.trash
                ? DismissDirection.endToStart
                : DismissDirection.horizontal,
        onDismissed: (direction) {
          if (mode != ItemModel.trash) {
            if (direction == DismissDirection.endToStart) {
              ref.read(softDeleteSnippet(snippet));
              ref.read(tappedSnippetStateProvider.notifier).state = null;
              final cont = ref.read(codeEditorController);
              if (cont != null) {
                cont.clearComposing();
              }
            }
          } else {
            if (direction == DismissDirection.startToEnd) {
              final newSnippet = snippet.copyWith(isDeleted: false);
              ref.read(updateSnippet(newSnippet));
            } else {
              ref.read(deleteSnippet(snippet));
            }
          }
        },

        background:
            mode != ItemModel.trash
                ? Container(
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
                )
                : Container(
                  color: backgound,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.refresh, color: iconbg, size: 24),
                      const Spacer(),
                      Icon(Icons.delete, color: Colors.redAccent, size: 24),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
        child: GestureDetector(
          onTap: () {
            ref.read(tappedSnippetStateProvider.notifier).state = snippet;
            if (snippet.isDeleted == false) {
              ref.read(isCodeEditorEnabled.notifier).state = true;
              ref.read(codeEditorCodeHolder.notifier).state = snippet.code;
            } else {
              ref.read(isCodeEditorEnabled.notifier).state = false;
              ref.read(codeEditorCodeHolder.notifier).state = snippet.code;
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              border:
                  isSnippetSelected != null &&
                          isSnippetSelected.id == snippet.id
                      ? Border(left: BorderSide(color: iconbg, width: 3))
                      : null,
              borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
            ),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(snippet.name, style: TextStyle(color: iconbg)),
                  const Spacer(),
                  IconButton(
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child:
                          snippet.isLiked
                              ? Icon(
                                Icons.favorite_rounded,
                                color: Colors.redAccent,
                              )
                              : Icon(
                                Icons.favorite_border_rounded,
                                color: iconbg,
                              ),
                    ),

                    onPressed:
                        mode != ItemModel.trash
                            ? () {
                              _toggleFavoriteButton(ref, snippet);
                            }
                            : null,
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child:
                          snippet.isBookmarked
                              ? Icon(
                                Icons.bookmarks_rounded,
                                color: Colors.blueAccent,
                              )
                              : Icon(
                                Icons.bookmark_border_rounded,
                                color: iconbg,
                              ),
                    ),

                    onPressed:
                        mode != ItemModel.trash
                            ? () {
                              _toggleBookMarkButton(ref, snippet);
                            }
                            : null,
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

void _toggleFavoriteButton(WidgetRef ref, SnippetModel snippet) {
  final newSnippet = snippet.copyWith(isLiked: !snippet.isLiked);
  ref.read(updateSnippet(newSnippet));
}

void _toggleBookMarkButton(WidgetRef ref, SnippetModel snippet) {
  final newSnippet = snippet.copyWith(isBookmarked: !snippet.isBookmarked);
  ref.read(updateSnippet(newSnippet));
}
