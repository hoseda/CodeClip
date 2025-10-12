import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/core/utils/get_constrasting_color.dart';
import 'package:snippet_code/features/database/database_provider.dart';
import 'package:snippet_code/features/home/model/tag_model.dart';
import 'package:snippet_code/features/home/repositories/tag_section/generating_tag_providers.dart';

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
  final tagList = ref.watch(tagListStreamProvider);
  final selectedTags = ref.watch(selectedTagIdsProvider);
  return tagList.when(
    data: (tags) {
      final filteredTags =
          input.isEmpty
              ? tags
              : tags
                  .where(
                    (t) => t.title.toLowerCase().contains(input.toLowerCase()),
                  )
                  .toList();

      if (filteredTags.isEmpty) {
        return Center(
          child: Text(
            input.isEmpty ? "No Tags Yet." : "No Results Found.",
            style: TextStyle(color: iconbg),
          ),
        );
      }
      return Wrap(
        runSpacing: 11,
        spacing: 11,
        children:
            filteredTags.map((tag) {
              final isSelected = selectedTags.contains(tag.id);
              return generateTag(
                tag,
                onDelete: () {
                  ref.read(deleteTag(tag));
                },
                onTap: () {
                  toggleTagSelection(ref, tag);
                },
                isSelected: isSelected,
              );
            }).toList(),
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

void toggleTagSelection(WidgetRef ref, TagModel tag) {
  final selected = ref.read(selectedTagIdsProvider.notifier);
  final current = {...selected.state};

  if (current.contains(tag.id)) {
    current.remove(tag.id);
  } else {
    current.add(tag.id);
  }

  selected.state = current;
}
