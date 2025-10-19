import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/core/constants/colors.dart';

Future<void> codeEditorSettings(BuildContext context) async {
  return showDialog(
    context: context,
    builder:
        (context) => Consumer(
          builder: (context, ref, child) {
            return AlertDialog(
              title: Text("Code Editor Settings"),
              titleTextStyle: TextStyle(
                color: iconbg,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              titlePadding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              backgroundColor: button,
              contentPadding: EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 15,
              ),
              content: SizedBox(
                width: 300,
                height: 100,
                child: Center(
                  child: Text(
                    "NOT IMPLEMENTED YET.",
                    style: TextStyle(color: iconbg),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: iconbg, fontSize: 16),
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Apply")),
              ],
              actionsAlignment: MainAxisAlignment.spaceBetween,
            );
          },
        ),
  );
}
