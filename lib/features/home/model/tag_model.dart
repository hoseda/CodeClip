// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

Color colorFormHex(String hex) {
  hex = hex.replaceAll("#", "");
  if (hex.length == 6) hex = 'FF$hex';
  return Color(int.parse(hex, radix: 16));
}

String colorToHex(Color color) {
  return '#${color.value.toInt().toRadixString(16).padLeft(8, '0').toUpperCase()}';
}

class TagModel {
  final int id;
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

  TagModel copyWith({int? id, String? title, Color? color, bool? isSelected}) {
    return TagModel(
      id: id ?? this.id,
      title: title ?? this.title,
      color: color ?? this.color,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'color': colorToHex(color),
      'isSelected': isSelected,
    };
  }

  factory TagModel.fromMap(Map<String, dynamic> map) {
    return TagModel(
      id: map['id'] as int,
      title: map['title'] as String,
      color: colorFormHex(map['color']),
      isSelected: map['isSelected'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TagModel.fromJson(String source) =>
      TagModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
