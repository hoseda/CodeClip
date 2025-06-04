import 'package:flutter/material.dart';
import 'package:snippet_code/code_editor.dart';

import 'package:flutter/material.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/features/home/presentation/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

