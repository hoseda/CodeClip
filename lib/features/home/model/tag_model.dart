// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TagModel {
  final String id;
  final String title;
  final Color color;
  final bool isSelected;

  TagModel({
    required this.id,
    required this.title,
    required this.color,
    this.isSelected = false,
  });

  @override
  String toString() => 'TagModel(id: $id, title: $title, color: $color)';

  TagModel copyWith({
    String? id,
    String? title,
    Color? color,
    bool? isSelected,
  }) {
    return TagModel(
      id: id ?? this.id,
      title: title ?? this.title,
      color: color ?? this.color,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
