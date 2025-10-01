import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/features/home/model/tag_model.dart';

double LongerLength(List<TagModel> lst) {
  double d = 0;
  for (var e in lst) {
    if (e.title.length > d) {
      d = e.title.length.toDouble();
    }
  }
  print(d);
  return d;
}

class TagDropDownMenu extends StatefulWidget {
  final List<TagModel> tagList;
  const TagDropDownMenu({super.key, required this.tagList});

  @override
  State<TagDropDownMenu> createState() => _TagDropDownMenuState();
}

class _TagDropDownMenuState extends State<TagDropDownMenu> {
  TagModel? selected;

  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selected,
      dropdownColor: button,
      underline: Center(),
      barrierDismissible: false,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      borderRadius: BorderRadius.circular(15),
      items:
          widget.tagList.map((TagModel e) {
            return DropdownMenuItem<TagModel>(
              value: e,
              child: Text(e.title, style: TextStyle(color: e.color)),
            );
          }).toList(),
      onChanged: (v) {
        setState(() {
          selected = v!;
        });
      },
    );
  }
}
