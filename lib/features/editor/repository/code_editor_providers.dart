import 'package:code_text_field/code_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/highlight_core.dart';
import 'package:highlight/languages/all.dart';
import 'package:snippet_code/features/home/repositories/snippet%20section/snippet_section_providers.dart';

final isCodeEditorEnabled = StateProvider<bool>((ref) {
  final repo = ref.watch(tappedSnippetStateProvider);
  return repo != null;
});
final codeEditorCodeHolder = StateProvider<String>((ref) {
  final repo = ref.watch(tappedSnippetStateProvider);
  return repo?.code ?? "";
});

final codeThemeNameCodeEditorStateProvider = StateProvider<String>((ref) {
  final repo = ref.watch(tappedSnippetStateProvider);
  return repo != null && allLanguages.keys.contains(repo.lang)
      ? repo.lang
      : "dart";
});
final codeThemeModelCodeEditorStateProvider = StateProvider<Mode?>((ref) {
  final repo = ref.watch(codeThemeNameCodeEditorStateProvider);
  return allLanguages[repo];
});

final codeEditorController = StateProvider<CodeController?>((ref) {
  final mode = ref.watch(codeThemeModelCodeEditorStateProvider);
  final txt = ref.watch(codeEditorCodeHolder);
  return CodeController(text: txt, language: mode);
});
