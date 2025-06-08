import 'package:flutter/material.dart';
import 'package:snippet_code/features/home/model/tag_model.dart';
import 'package:snippet_code/features/home/presentation/generate_tag_popup_menu.dart';

Widget generateTag(
  TagModel tag, {
  VoidCallback? onDelete,
  VoidCallback? onTap,
  bool isSelected = false,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
    child: FilterChip(
      label: Text(
        tag.title,
        style: TextStyle(
          color: getContrastingTextColor(tag.color),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      onSelected: onTap != null ? (value) => onTap : null,
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
      // side:
      //     isSelected
      //         ? BorderSide(color: getContrastingTextColor(tag.color), width: 2)
      //         : BorderSide(color: Colors.transparent, width: 2),
      side: BorderSide(color: Colors.transparent, width: 2),
    ),
  );
}
