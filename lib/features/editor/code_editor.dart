import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/features/editor/repository/code_editor_providers.dart';
import 'package:snippet_code/features/home/repositories/snippet%20section/snippet_section_providers.dart';

class CodeEditor extends ConsumerStatefulWidget {
  const CodeEditor({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CodeEditorState();
}

class _CodeEditorState extends ConsumerState<CodeEditor> {
  CodeController? _codeController;

  @override
  void initState() {
    super.initState();
    final code = ref.read(codeEditorCodeHolder);
    final mode = ref.read(codeThemeModelCodeEditorStateProvider);
    _codeController = CodeController(text: code, language: mode);
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final code = ref.watch(codeEditorCodeHolder);
    final mode = ref.watch(codeThemeModelCodeEditorStateProvider);
    final isEnaled = ref.watch(isCodeEditorEnabled);

    if (_codeController?.text != code) {
      _codeController?.text = code;
      _codeController?.selection = TextSelection.collapsed(offset: code.length);
    }

    if (_codeController?.language != mode) {
      _codeController?.language = mode;
    }

    return CodeTheme(
      data: CodeThemeData(styles: vs2015Theme),
      child: CodeField(
        controller: _codeController!,
        readOnly: ref.watch(tappedSnippetStateProvider)?.isDeleted ?? false,
        enabled: isEnaled,
        background: backgound,
        cursorColor: iconbg,
        textSelectionTheme: TextSelectionThemeData(selectionColor: button),
        textStyle: TextStyle(fontFamily: 'SourceCode', color: iconbg),
        onChanged: (code) {
          ref.read(codeEditorCodeHolder.notifier).state = code;
        },
      ),
    );
  }
}
