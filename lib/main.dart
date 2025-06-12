import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/features/database/tag_database.dart';
import 'package:snippet_code/features/home/presentation/home_page.dart';
import 'package:window_size/window_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle("Code Clip");
    setWindowMinSize(const Size(1280, 720));
    setWindowMaxSize(const Size(1280, 900));
  }
  final db = AppDatabase();
  final a = await db.select(db.tagTable).get();
  runApp(ProviderScope(child: const App()));
  print(a.length);
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "PublicSans"),
      home: const HomePage(),
    );
  }
}
