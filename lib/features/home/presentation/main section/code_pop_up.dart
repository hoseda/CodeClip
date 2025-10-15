import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/core/utils/get_constrasting_color.dart';
import 'package:snippet_code/features/database/database_provider.dart';
import 'package:snippet_code/features/home/model/snippet_model.dart';
import 'package:snippet_code/features/home/model/tag_model.dart';
import 'package:snippet_code/features/home/presentation/tag%20section/generate_tag.dart';
import 'package:snippet_code/features/home/repositories/main_section/fetch_and_send_tags_provider.dart';

Future<void> getCodePopUpMenu(BuildContext context) async {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerCode = TextEditingController();

  final formKey = GlobalKey<FormState>();

  return showDialog(
    context: context,
    builder:
        (context) => Consumer(
          builder: (context, ref, child) {
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
                            child: generateTagListCodePopUp(ref),
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
                ElevatedButton(
                  onPressed: () {
                    final currentName = controllerName.text.trim();
                    final currentCode = controllerCode.text.trim();
                    final curruntTags = ref.read(selectedTagsCodePopUpProvider);
                    if (currentName.isNotEmpty &&
                        currentCode.isNotEmpty &&
                        formKey.currentState!.validate()) {
                      _addNewSnippet(
                        ref,
                        currentName,
                        currentCode,
                        curruntTags,
                        false,
                        false,
                      );
                      Navigator.of(context).pop();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "SnippetCode '$currentName' created successfully!",
                            style: TextStyle(
                              color: getContrastingTextColor(primary),
                            ),
                          ),
                          width: 300,
                          duration: const Duration(seconds: 1),
                          backgroundColor: primary,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  child: Text("Add"),
                ),
              ],
              actionsAlignment: MainAxisAlignment.spaceBetween,
            );
          },
        ),
  );
}

Widget generateTagListCodePopUp(WidgetRef ref) {
  final tagList = ref.watch(tagListStreamProvider);
  final selectedTags = ref.watch(selectedTagsCodePopUpProvider);
  return tagList.when(
    data: (tags) {
      if (tags.isEmpty) {
        return Center(
          child: Text("No Tags Yet.", style: TextStyle(color: iconbg)),
        );
      }
      return Wrap(
        runSpacing: 11,
        spacing: 11,
        children:
            tags.map((tag) {
              final isSelected = selectedTags.contains(tag.id);
              return generateTag(
                tag,
                onTap: () {
                  toggleTagCodePopUpSelection(ref, tag);
                },
                isSelected: isSelected,
              );
            }).toList(),
      );
    },
    error: (error, stackTrace) {
      return Text(
        "Errors : $error | Stack : $stackTrace",
        style: TextStyle(color: Colors.red),
      );
    },
    loading: () => const CircularProgressIndicator(),
  );
}

void toggleTagCodePopUpSelection(WidgetRef ref, TagModel tag) {
  final selected = ref.read(selectedTagsCodePopUpProvider.notifier);
  final current = {...selected.state};

  if (current.contains(tag.id)) {
    current.remove(tag.id);
  } else {
    current.add(tag.id);
  }

  selected.state = current;
}

void _addNewSnippet(
  WidgetRef ref,
  String name,
  String code,
  Set<int> tags,
  bool isLiked,
  bool isBookmarked,
) {
  final newSnippet = SnippetModel(
    id: DateTime.now().millisecondsSinceEpoch.toInt(),
    name: name,
    code: code,
    tagsId: tags,
    isLiked: isLiked,
    isBookmarked: isBookmarked,
  );
  ref.read(addNewSnippet(newSnippet));
}

// TODO : have some error.
