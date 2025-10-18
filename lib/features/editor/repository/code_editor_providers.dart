import 'package:flutter_riverpod/flutter_riverpod.dart';

final isCodeEditorEnabled = StateProvider<bool>((ref) => false);
final codeEditorCodeHolder = StateProvider<String>((ref) => "");
