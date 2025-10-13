import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/features/home/model/snippet_model.dart';

final snippetListStateProvider = StateProvider<List<SnippetModel>>((ref) => []);

extension SnippetTools on List<SnippetModel> {
  List<SnippetModel> deleteSnippet(int id) {
    final newList = where((t) => t.id != id).toList();
    return newList;
  }
}
