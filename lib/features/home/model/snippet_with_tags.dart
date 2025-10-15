import 'package:snippet_code/features/database/app_database.dart';

class SnippetWithTags {
  final SnippetTableData snippet;
  final List<TagTableData> tags;

  SnippetWithTags({required this.snippet, required this.tags});
}
