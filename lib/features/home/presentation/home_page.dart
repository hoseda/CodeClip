import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hovering/hovering.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/core/constants/menu_names.dart';
import 'package:snippet_code/features/home/presentation/generate_tag.dart';
import 'package:snippet_code/features/home/presentation/generate_tag_popup_menu.dart';
import 'package:snippet_code/features/home/presentation/item_list.dart';
import 'package:snippet_code/features/home/repositories/generating_tag_providers.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgound,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              width: 100,
                              height: 50,
                              child: Image.asset(
                                "assets/icons/icon.png",
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Divider(color: button),
                          Text(
                            "Library",
                            style: TextStyle(
                              color: iconbg,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // const SizedBox(height: 20),
                          ...List.generate(4, (index) {
                            final shadow = leftSide;
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: HoverButton(
                                onpressed: () {},
                                hoverColor: button,
                                child: itemList(
                                  shadow[index]["title"] as String,
                                  shadow[index]["icon"] as Widget,
                                ),
                              ),
                            );
                          }),
                          Divider(color: button),
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tags",
                                style: TextStyle(
                                  color: iconbg,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  ref
                                      .read(tagTitleStateProvider.notifier)
                                      .state = "";
                                  ref
                                      .read(tagColorStateProvider.notifier)
                                      .state = iconbg;
                                  popUpMenu(context);
                                },
                                icon: Icon(Icons.add, color: iconbg),
                                hoverColor: button,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.maxFinite,
                            height: 40,
                            child: SearchBar(
                              hintText: "Search Tags",
                              hintStyle: WidgetStatePropertyAll(
                                TextStyle(
                                  color: iconbg,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              textStyle: WidgetStatePropertyAll(
                                TextStyle(
                                  color: iconbg,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              backgroundColor: WidgetStatePropertyAll(button),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              leading: Icon(Icons.search, color: iconbg),
                            ),
                          ),
                          const SizedBox(height: 10),
                          generateTagList(ref),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          // Expanded(child: Container(color: Colors.amber)),
                        ],
                      ),
                    ),

                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          // Expanded(child: Container(color: Colors.blue)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
