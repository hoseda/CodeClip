import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/all.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/features/editor/repository/code_editor_providers.dart';

Widget themeDropDownMenu(WidgetRef ref) {
  final selectedTheme = ref.watch(codeThemeNameCodeEditorStateProvider);
  final searchController = TextEditingController();
  return DropdownButton2(
    value: selectedTheme,
    dropdownStyleData: DropdownStyleData(
      maxHeight: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: button,
      ),
    ),
    buttonStyleData: ButtonStyleData(
      decoration: BoxDecoration(
        color: backgound,
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    dropdownSearchData: DropdownSearchData(
      searchController: searchController,
      searchInnerWidgetHeight: 50,
      searchInnerWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: searchController,
          style: TextStyle(color: iconbg, fontSize: 14),
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(
              color: iconbg.withValues(alpha: 0.6),
              fontSize: 14,
            ),
            border: OutlineInputBorder(),
            isDense: true,
            contentPadding: const EdgeInsets.all(8),
          ),
        ),
      ),
      searchMatchFn: (DropdownMenuItem<String> item, searchValue) {
        return item.value!.toLowerCase().contains(searchValue.toLowerCase());
      },
    ),
    items:
        allLanguages.entries.map((i) {
          return DropdownMenuItem<String>(
            value: i.key.toString(),
            child: Text(i.key, style: TextStyle(color: iconbg)),
          );
        }).toList(),
    onChanged: (value) {
      ref.read(codeThemeNameCodeEditorStateProvider.notifier).state = value!;
    },
  );
}
