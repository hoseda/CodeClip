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
    final source = "def fib(): \n\t pass ";
    _codeController = CodeController(text: source, language: dart);
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEnaled = ref.watch(isCodeEditorEnabled);
    return CodeTheme(
      data: CodeThemeData(styles: vs2015Theme),
      child: CodeField(
        controller: _codeController!,
        background: backgound,
        cursorColor: iconbg,
        enabled: isEnaled,
        textSelectionTheme: TextSelectionThemeData(selectionColor: button),
        textStyle: TextStyle(fontFamily: 'SourceCode', color: iconbg),
      ),
    );
  }
}


//TODO : code editor should be enabled only when clicked on a snippet 
//TODO : when clicking on snippet its code will display on code editor
//TODO : the default theme of code can be change using setting button
//TODO : put a save code button above + button