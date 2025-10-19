import 'package:code_text_field/code_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/highlight_core.dart';
import 'package:highlight/languages/all.dart';

final isCodeEditorEnabled = StateProvider<bool>((ref) => false);
final codeEditorCodeHolder = StateProvider<String>((ref) => "");

final codeThemeNameCodeEditorStateProvider = StateProvider<String>(
  (ref) => "dart",
);
final codeThemeModelCodeEditorStateProvider = StateProvider<Mode?>((ref) {
  final repo = ref.watch(codeThemeNameCodeEditorStateProvider);
  return allLanguages[repo];
});

final codeEditorController = StateProvider<CodeController?>((ref) {
  final repo = ref.watch(codeThemeModelCodeEditorStateProvider);
  return CodeController(text: "", language: repo);
});
