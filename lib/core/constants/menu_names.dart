import 'package:flutter/material.dart';
import 'package:snippet_code/features/home/model/menu_item_model.dart';

final leftSide = [
  {"model": ItemModel.all, "title": "All Snippets", "icon": Icons.code_rounded},
  {
    "model": ItemModel.bookmark,
    "title": "Bookmark",
    "icon": Icons.bookmark_border_rounded,
  },
  {
    "model": ItemModel.like,
    "title": "Favorite",
    "icon": Icons.favorite_outline_rounded,
  },
  {
    "model": ItemModel.trash,
    "title": "Trash",
    "icon": Icons.delete_outline_rounded,
  },
];
