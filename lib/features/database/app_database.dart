import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class TagTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 15)();
  TextColumn get color => text().withLength(max: 100)();
}

class SnippetTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  TextColumn get code => text()();
  TextColumn get lang => text().nullable()();
  BoolColumn get isLiked => boolean()();
  BoolColumn get isBookmarked => boolean()();
  BoolColumn get isDeleted => boolean()();
}

class SnippetTagTable extends Table {
  IntColumn get snippetId =>
      integer().references(SnippetTable, #id, onDelete: KeyAction.cascade)();
  IntColumn get tagId =>
      integer().references(TagTable, #id, onDelete: KeyAction.cascade)();
}

@DriftDatabase(tables: [TagTable, SnippetTable, SnippetTagTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase openConnection() {
    return LazyDatabase(() async {
      final dbFolder = Directory.current;

      final dbDirectory = Directory(
        p.join(dbFolder.path, "lib", "features", "database", "db"),
      );

      if (!await dbDirectory.exists()) {
        await dbFolder.create(recursive: true);
      }

      final file = File(p.join(dbDirectory.path, "clipcode.db"));
      return NativeDatabase(file);
    });
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },

      onUpgrade: (m, from, to) async {
        //todo : add logic of migration here.
        if (from < 2) {}
      },
    );
  }
}
