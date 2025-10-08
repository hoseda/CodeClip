import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/features/home/model/snippet_model.dart';
import 'package:snippet_code/features/home/presentation/snippet%20section/generate_snippet_code.dart';
import 'package:snippet_code/features/home/repositories/snippet%20section/snippet_section_providers.dart';

Widget generateSnippetList(WidgetRef ref, String input) {
  //TODO : CONNET IT TO DB .
  final snippets = ref.watch(snippetListStateProvider);
  List<SnippetModel> filteredList = snippets;
  if (input.isNotEmpty) {
    filteredList =
        snippets
            .where((t) => t.name.toLowerCase().contains(input.toLowerCase()))
            .toList();
  }

  if (snippets.isEmpty) {
    return Center(
      child: Text("No Snippet Yet.", style: TextStyle(color: iconbg)),
    );
  }

  return Wrap(
    spacing: 10,
    runSpacing: 10,
    children: filteredList.map((t) => generateSnippetCode(ref, t)).toList(),
  );
}
