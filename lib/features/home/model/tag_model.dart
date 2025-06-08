// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TagModel {
  final String id;
  final String title;
  final Color color;
  TagModel({
    required this.id,
    required this.title,
    required this.color,
  });

  @override
  String toString() => 'TagModel(id: $id, title: $title, color: $color)';
}
