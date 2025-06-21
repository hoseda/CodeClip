import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/features/database/tag_database.dart';

final dataBaseProvider = StateProvider<AppDatabase>((ref) {
  return AppDatabase();
});
