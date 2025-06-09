import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/core/utils/get_constrasting_color.dart';
import 'package:snippet_code/features/home/model/tag_model.dart';
import 'package:snippet_code/features/home/repositories/generating_tag_providers.dart';

Future<void> popUpMenu(BuildContext context) async {
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  return showDialog(
    context: context,
    builder: (context) {
      return Consumer(
        builder: (context, ref, child) {
          final selectedColor = ref.watch(tagColorStateProvider);
          final tagTitle = ref.watch(tagTitleStateProvider);

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
            content: Form(
              key: formKey,
              child: SizedBox(
                height: 140,
                width: 230,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: controller,
                      onChanged: (value) {
                        ref.read(tagTitleStateProvider.notifier).state =
                            value.trim();
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Tag name cannot be empty.";
                        }
                        return null;
                      },
                      maxLength: 15,
                      style: TextStyle(color: iconbg),
                      decoration: InputDecoration(
                        hintText: "Tag Name",
                        hintStyle: TextStyle(color: iconbg),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: iconbg),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: iconbg, width: 2),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: iconbg, width: 1),
                        ),
                        contentPadding: EdgeInsets.all(0),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children:
                          [
                                Colors.amberAccent,
                                Colors.lightGreen,
                                Colors.lightBlue,
                                Colors.redAccent,
                                Colors.teal,
                                iconbg,
                              ]
                              .map(
                                (color) => createColorfullCircles(
                                  color,
                                  28,
                                  selectedColor == color,
                                ),
                              )
                              .toList(),
                    ),
                  ],
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
              ElevatedButton(
                onPressed: () {
                  final currentTitle = controller.text.trim();
                  if (currentTitle.isNotEmpty &&
                      formKey.currentState!.validate()) {
                    _addNewTag(ref, tagTitle, selectedColor);
                    Navigator.of(context).pop();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Tag '$currentTitle' created successfully!",
                          style: TextStyle(color: getContrastingTextColor(selectedColor)),
                        ),
                        width: 300,
                        backgroundColor: selectedColor,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedColor,
                  foregroundColor: getContrastingTextColor(selectedColor),
                ),
                child: Text("OK"),
              ),
            ],
            actionsAlignment: MainAxisAlignment.spaceBetween,
          );
        },
      );
    },
  );
}

Widget createColorfullCircles(Color color, double size, bool isSelected) {
  return Consumer(
    builder: (context, ref, child) {
      return GestureDetector(
        onTap: () {
          ref.read(tagColorStateProvider.notifier).state = color;
        },
        child: AnimatedContainer(
          width: size,
          height: size,
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(size / 2),
            border:
                isSelected
                    ? Border.all(color: Colors.black, width: 2)
                    : Border.all(color: Colors.transparent, width: 2),
          ),
        ),
      );
    },
  );
}

void _addNewTag(WidgetRef ref, String title, Color color) {
  final currentTags = ref.read(tagListStateProvider);
  final newTag = TagModel(
    id: DateTime.now().millisecondsSinceEpoch.toString(),
    title: title,
    color: color,
  );

  ref.read(tagListStateProvider.notifier).state = [...currentTags, newTag];
}

