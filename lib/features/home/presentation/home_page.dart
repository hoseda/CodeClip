import 'package:flutter/material.dart';
import 'package:snippet_code/core/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgound,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 50,
                            child: Image.asset(
                              "assets/icons/icon.png",
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 20,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(child: Container(color: Colors.amber)),
                        ],
                      ),
                    ),

                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(child: Container(color: Colors.blue)),
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
