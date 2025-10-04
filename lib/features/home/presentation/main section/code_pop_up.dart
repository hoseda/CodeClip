import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/features/home/presentation/tag%20section/generate_tag.dart';
import 'package:snippet_code/features/home/repositories/main_section/fetch_and_send_tags_provider.dart';
import 'package:snippet_code/features/home/repositories/tag_section/generating_tag_providers.dart';

Future<void> getCodePopUpMenu(BuildContext context) async {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerCode = TextEditingController();

  final formKey = GlobalKey<FormState>();

  return showDialog(
    context: context,
    builder:
        (context) => Consumer(
          builder: (context, ref, child) {
            final tags = ref.watch(tagListStateProvider);
            final selectedTags = ref.watch(selectedTagsProvider);
            return AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add a Snippet"),
                  Icon(Icons.add_rounded, color: iconbg),
                ],
              ),
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
              content: Form(
                key: formKey,
                child: SizedBox(
                  width: 690,
                  height: 420,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: controllerName,
                          maxLength: 100,
                          style: TextStyle(color: iconbg),
                          decoration: InputDecoration(
                            hintText: "Snippet Name",
                            hintStyle: TextStyle(color: iconbg),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: iconbg),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: iconbg, width: 2),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: iconbg, width: 1),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: iconbg),
                            ),
                            contentPadding: EdgeInsets.all(0),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controllerCode,
                          minLines: 8,
                          maxLines: 100,
                          showCursor: true,
                          scrollPhysics: AlwaysScrollableScrollPhysics(),
                          style: TextStyle(color: iconbg),
                          decoration: InputDecoration(
                            hintText: "Snippet Code here ...",
                            hintStyle: TextStyle(color: iconbg),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: iconbg),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: iconbg),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: iconbg, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: iconbg, width: 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Tags : ",
                          style: TextStyle(
                            color: iconbg,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children:
                                    tags
                                        .map(
                                          (tag) => generateTag(
                                            tag,
                                            isSelected: selectedTags.contains(
                                              tag,
                                            ),
                                            onTap: () {
                                              if (selectedTags.contains(tag)) {
                                                removeSelectedTags(ref, tag);
                                              } else {
                                                addToSelectedTags(ref, tag);
                                              }
                                            },
                                          ),
                                        )
                                        .toList(),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    clearSelectedTagsSet(ref);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: iconbg, fontSize: 16),
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Add")),
              ],
              actionsAlignment: MainAxisAlignment.spaceBetween,
            );
          },
        ),
  );
}
