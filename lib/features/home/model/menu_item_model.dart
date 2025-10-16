import 'package:flutter/widgets.dart';

enum ItemModel { all, bookmark, like, trash }

class MenuItemModel {
  final ItemModel model;
  final String name;
  final IconData icon;
  final bool isSelected;

  MenuItemModel({
    required this.model,
    required this.name,
    required this.icon,
    required this.isSelected,
  });

  @override
  String toString() {
    return "MenuItemModel : Model : $model , Name : $name , Icon : $icon , Selected : $isSelected";
  }
}
