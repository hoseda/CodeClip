import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/features/home/repositories/generating_tag_providers.dart';

Widget generateTag(Widget? title, Color? backgroundColor) {
  return FilterChip(label: title ?? Text("lable"), onSelected: (value) {});
}

Future<void> popUpMenu(BuildContext context) async {
  TextEditingController controller = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return Consumer(
        builder: (context, ref, child) {
          final color = ref.watch(tagColorStateProvider);
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("Add Tag"),
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
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            content: SizedBox(
              height: 140,
              width: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    controller: controller,
                    onSubmitted: (value) {
                      ref.read(tagTitleStateProvider.notifier).state = value;
                    },
                    maxLength: 15,
                    style: TextStyle(color: color),
                    decoration: InputDecoration(
                      hintText: "Tag Name",
                      hintStyle: TextStyle(color: color),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: color),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: color, width: 2),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: color, width: 1),
                      ),
                      contentPadding: EdgeInsets.all(0),
                    ),
                  ),
                  const SizedBox(height: 23),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      createColorfullCircles(Colors.amberAccent, 23),
                      createColorfullCircles(Colors.lightGreen, 23),
                      createColorfullCircles(Colors.lightBlue, 23),
                      createColorfullCircles(Colors.redAccent, 23),
                      createColorfullCircles(Colors.white, 23),
                      createColorfullCircles(iconbg, 23),
                    ],
                  ),
                ],
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
              TextButton(
                onPressed: () {},
                child: Text(
                  "OK",
                  style: TextStyle(color: iconbg, fontSize: 16),
                ),
              ),
            ],
            actionsAlignment: MainAxisAlignment.spaceBetween,
          );
        },
      );
    },
  );
}

Widget createColorfullCircles(Color? color, double? size) {
  return Consumer(
    builder: (context, ref, child) {
      return GestureDetector(
        onTap: () {
          ref.read(tagColorStateProvider.notifier).state = color!;
        },
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      );
    },
  );
}
