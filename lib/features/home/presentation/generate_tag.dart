import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/core/utils/get_constrasting_color.dart';
import 'package:snippet_code/features/home/model/tag_model.dart';
import 'package:snippet_code/features/home/repositories/generating_tag_providers.dart';

Widget generateTag(
  TagModel tag, {
  VoidCallback? onDelete,
  VoidCallback? onTap,
  bool isSelected = false,
}) {
  return FilterChip(
    label: Text(
      tag.title,
      style: TextStyle(
        color: getContrastingTextColor(tag.color),
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    onSelected: onTap != null ? (value) => onTap() : null,
    color: WidgetStatePropertyAll(tag.color.withValues(alpha: 0.9)),
    selectedColor: tag.color,
    selected: isSelected,
    deleteIcon:
        onDelete != null
            ? Icon(
              Icons.close_rounded,
              color: getContrastingTextColor(tag.color),
              size: 16,
            )
            : null,
    onDeleted: onDelete,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.compact,
    side:
        isSelected
            ? BorderSide(color: getContrastingTextColor(tag.color), width: 2)
            : BorderSide(color: Colors.transparent, width: 2),
  );
}

Widget generateTagList(WidgetRef ref, String input) {
  final tagList = ref.watch(searchInTagsProvider(input));
  return input.isEmpty ? tagList.isEmpty
      ? Center(child: Text("No Tags here,", style: TextStyle(color: iconbg)))
      : Wrap(
        runSpacing: 11,
        spacing: 11,
        children:
            tagList
                .map(
                  (tag) => generateTag(
                    tag,
                    onDelete: () {
                      final updatedTag =
                          tagList.where((t) => t.id != tag.id).toList();
                      ref.read(tagListStateProvider.notifier).state =
                          updatedTag;
                    },
                    onTap: () {
                      final newTag = tag.copyWith(isSelected: !tag.isSelected);
                      final idx = tagList.indexOf(tag);
                      final updatedList = List<TagModel>.from(tagList);
                      updatedList[idx] = newTag;
                      ref.read(tagListStateProvider.notifier).state =
                          updatedList;
                    },
                    isSelected: tag.isSelected,
                  ),
                )
                .toList(),
      ) : Center(child: Text("No Results Found.", style: TextStyle(color: iconbg)));
}
