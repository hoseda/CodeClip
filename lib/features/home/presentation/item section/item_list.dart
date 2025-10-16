import 'package:flutter/material.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/features/home/model/menu_item_model.dart';

Widget menuListItem(MenuItemModel item) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    width: double.maxFinite,
    height: 45,
    padding: EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          child: Icon(item.icon, color: item.isSelected ? Colors.cyan : iconbg),
        ),
        SizedBox(width: 20),
        Text(
          item.name,
          style: TextStyle(
            color: item.isSelected ? Colors.cyan : iconbg,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
