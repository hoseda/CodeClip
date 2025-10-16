import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/features/database/database_provider.dart';
import 'package:snippet_code/features/home/model/menu_item_model.dart';
import 'package:snippet_code/features/home/model/snippet_model.dart';
import 'package:snippet_code/features/home/presentation/snippet%20section/generate_snippet_code.dart';
import 'package:snippet_code/features/home/repositories/item%20section/item_secrion_repo.dart';

Widget generateSnippetList(WidgetRef ref, String input) {
  final asyncSnippets = ref.watch(snippeWithTagstListStreamProvider);
  final itemModel = ref.watch(selectedMenuItemStateProvider);
  return asyncSnippets.when(
    data: (snippets) {
      List<SnippetModel> filteredList = snippets;

      switch (itemModel) {
        case ItemModel.all:
          filteredList =
              filteredList.where((i) => i.isDeleted == false).toList();

        case ItemModel.bookmark:
          filteredList =
              filteredList
                  .where(
                    (i) => (i.isBookmarked == true) && (i.isDeleted == false),
                  )
                  .toList();
        case ItemModel.like:
          filteredList =
              filteredList
                  .where((i) => i.isLiked == true && (i.isDeleted == false))
                  .toList();
        case ItemModel.trash:
          filteredList =
              filteredList.where((i) => i.isDeleted == true).toList();
      }

      if (input.isNotEmpty) {
        filteredList =
            snippets
                .where(
                  (t) => t.name.toLowerCase().contains(input.toLowerCase()),
                )
                .toList();
      }

      if (snippets.isEmpty) {
        return Center(
          child: Text("No Snippet Yet.", style: TextStyle(color: iconbg)),
        );
      }

      if (filteredList.isEmpty) {
        return Center(
          child: Text("No Such Snippet.", style: TextStyle(color: iconbg)),
        );
      }

      return Wrap(
        spacing: 10,
        runSpacing: 10,
        children: filteredList.map((t) => generateSnippetCode(ref, t)).toList(),
      );
    },
    error: (error, stackTrace) {
      return Text(
        "Errors : $error | Stack : $stackTrace",
        style: TextStyle(color: Colors.red),
      );
    },
    loading: () => const CircularProgressIndicator(),
  );
}
