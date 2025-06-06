import 'package:flutter/material.dart';
import 'package:snippet_code/core/constants/colors.dart';

Widget generateTag(
  Widget? title,
  Widget? icon,
  Color? textcolor,
  Color? backgroundColor,
) {
  return FilterChip(label: title ?? Text("lable"), onSelected: (value){});
}

Future<void> popUpMenu(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Add Tag"),
              Icon(Icons.edit_rounded, color: iconbg),
            ],
          ),
          titleTextStyle: TextStyle(
            color: iconbg,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          titlePadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          backgroundColor: button,
          content: Column(children: [Center(child:Text("content"))],),
        );
      },
    );
  }
