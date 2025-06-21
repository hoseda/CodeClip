// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'color': color.value,
      'isSelected': isSelected,
    };
  }

  factory TagModel.fromMap(Map<String, dynamic> map) {
    return TagModel(
      id: map['id'] as String,
      title: map['title'] as String,
      color: Color(map['color'] as int),
      isSelected: map['isSelected'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TagModel.fromJson(String source) => TagModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
