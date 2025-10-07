import 'package:flutter/material.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/features/home/model/snippet_model.dart';

Widget generateSnippetCode(SnippetModel snippet) {
  return ListTile(title: Text(snippet.name), hoverColor: primary);
}
