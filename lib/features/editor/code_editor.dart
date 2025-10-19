import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/dart.dart';
import 'package:snippet_code/core/constants/colors.dart';
import 'package:snippet_code/features/editor/repository/code_editor_providers.dart';

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
    _codeController = ref.read(codeEditorController);
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEnaled = ref.watch(isCodeEditorEnabled);
    final code = ref.watch(codeEditorCodeHolder);
    final mode = ref.read(codeThemeModelCodeEditorStateProvider);
    _codeController!.text = code;
    _codeController!.language = mode;

    return CodeTheme(
      data: CodeThemeData(styles: vs2015Theme),
      child: CodeField(
        controller: _codeController!,
        readOnly: !isEnaled,
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
