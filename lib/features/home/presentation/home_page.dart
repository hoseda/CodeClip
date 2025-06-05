import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/core/constants/menu_names.dart';
import 'package:snippet_code/features/home/presentation/item_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool foldersOpen = true;

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
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    foldersOpen = !foldersOpen;
                                  });
                                },
                                child:
                                    foldersOpen
                                        ? Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: iconbg,
                                        )
                                        : Icon(
                                          Icons.keyboard_arrow_up_rounded,
                                          color: iconbg,
                                        ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Folders",
                                style: TextStyle(
                                  color: iconbg,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TreeView.simple(
                                builder: (context, item) {
                                  return ListTile(
                                    title: Text("Item ${item.level} - ${item.key}"),
                                  );
                                },
                                tree: TreeNode.root()..add(TreeNode(data: "a",key: "0")),
                              ),
                            ],
                          ),
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
