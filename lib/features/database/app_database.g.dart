// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TagTableTable extends TagTable
    with TableInfo<$TagTableTable, TagTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 15,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, color];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tag_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TagTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      color:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}color'],
          )!,
    );
  }

  @override
  $TagTableTable createAlias(String alias) {
    return $TagTableTable(attachedDatabase, alias);
  }
}

class TagTableData extends DataClass implements Insertable<TagTableData> {
  final int id;
  final String title;
  final String color;
  const TagTableData({
    required this.id,
    required this.title,
    required this.color,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['color'] = Variable<String>(color);
    return map;
  }

  TagTableCompanion toCompanion(bool nullToAbsent) {
    return TagTableCompanion(
      id: Value(id),
      title: Value(title),
      color: Value(color),
    );
  }

  factory TagTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      color: serializer.fromJson<String>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'color': serializer.toJson<String>(color),
    };
  }

  TagTableData copyWith({int? id, String? title, String? color}) =>
      TagTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        color: color ?? this.color,
      );
  TagTableData copyWithCompanion(TagTableCompanion data) {
    return TagTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      color: data.color.present ? data.color.value : this.color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TagTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.color == this.color);
}

class TagTableCompanion extends UpdateCompanion<TagTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> color;
  const TagTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.color = const Value.absent(),
  });
  TagTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String color,
  }) : title = Value(title),
       color = Value(color);
  static Insertable<TagTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (color != null) 'color': color,
    });
  }

  TagTableCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? color,
  }) {
    return TagTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class $SnippetTableTable extends SnippetTable
    with TableInfo<$SnippetTableTable, SnippetTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SnippetTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagsJsonMeta = const VerificationMeta(
    'tagsJson',
  );
  @override
  late final GeneratedColumn<String> tagsJson = GeneratedColumn<String>(
    'tags_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isLikedMeta = const VerificationMeta(
    'isLiked',
  );
  @override
  late final GeneratedColumn<bool> isLiked = GeneratedColumn<bool>(
    'is_liked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_liked" IN (0, 1))',
    ),
  );
  static const VerificationMeta _isBookmarkedMeta = const VerificationMeta(
    'isBookmarked',
  );
  @override
  late final GeneratedColumn<bool> isBookmarked = GeneratedColumn<bool>(
    'is_bookmarked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_bookmarked" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    code,
    tagsJson,
    isLiked,
    isBookmarked,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'snippet_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SnippetTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('tags_json')) {
      context.handle(
        _tagsJsonMeta,
        tagsJson.isAcceptableOrUnknown(data['tags_json']!, _tagsJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_tagsJsonMeta);
    }
    if (data.containsKey('is_liked')) {
      context.handle(
        _isLikedMeta,
        isLiked.isAcceptableOrUnknown(data['is_liked']!, _isLikedMeta),
      );
    } else if (isInserting) {
      context.missing(_isLikedMeta);
    }
    if (data.containsKey('is_bookmarked')) {
      context.handle(
        _isBookmarkedMeta,
        isBookmarked.isAcceptableOrUnknown(
          data['is_bookmarked']!,
          _isBookmarkedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isBookmarkedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SnippetTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SnippetTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      code:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}code'],
          )!,
      tagsJson:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}tags_json'],
          )!,
      isLiked:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_liked'],
          )!,
      isBookmarked:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_bookmarked'],
          )!,
    );
  }

  @override
  $SnippetTableTable createAlias(String alias) {
    return $SnippetTableTable(attachedDatabase, alias);
  }
}

class SnippetTableData extends DataClass
    implements Insertable<SnippetTableData> {
  final int id;
  final String title;
  final String code;
  final String tagsJson;
  final bool isLiked;
  final bool isBookmarked;
  const SnippetTableData({
    required this.id,
    required this.title,
    required this.code,
    required this.tagsJson,
    required this.isLiked,
    required this.isBookmarked,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['code'] = Variable<String>(code);
    map['tags_json'] = Variable<String>(tagsJson);
    map['is_liked'] = Variable<bool>(isLiked);
    map['is_bookmarked'] = Variable<bool>(isBookmarked);
    return map;
  }

  SnippetTableCompanion toCompanion(bool nullToAbsent) {
    return SnippetTableCompanion(
      id: Value(id),
      title: Value(title),
      code: Value(code),
      tagsJson: Value(tagsJson),
      isLiked: Value(isLiked),
      isBookmarked: Value(isBookmarked),
    );
  }

  factory SnippetTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SnippetTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      code: serializer.fromJson<String>(json['code']),
      tagsJson: serializer.fromJson<String>(json['tagsJson']),
      isLiked: serializer.fromJson<bool>(json['isLiked']),
      isBookmarked: serializer.fromJson<bool>(json['isBookmarked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'code': serializer.toJson<String>(code),
      'tagsJson': serializer.toJson<String>(tagsJson),
      'isLiked': serializer.toJson<bool>(isLiked),
      'isBookmarked': serializer.toJson<bool>(isBookmarked),
    };
  }

  SnippetTableData copyWith({
    int? id,
    String? title,
    String? code,
    String? tagsJson,
    bool? isLiked,
    bool? isBookmarked,
  }) => SnippetTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    code: code ?? this.code,
    tagsJson: tagsJson ?? this.tagsJson,
    isLiked: isLiked ?? this.isLiked,
    isBookmarked: isBookmarked ?? this.isBookmarked,
  );
  SnippetTableData copyWithCompanion(SnippetTableCompanion data) {
    return SnippetTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      code: data.code.present ? data.code.value : this.code,
      tagsJson: data.tagsJson.present ? data.tagsJson.value : this.tagsJson,
      isLiked: data.isLiked.present ? data.isLiked.value : this.isLiked,
      isBookmarked:
          data.isBookmarked.present
              ? data.isBookmarked.value
              : this.isBookmarked,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SnippetTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('code: $code, ')
          ..write('tagsJson: $tagsJson, ')
          ..write('isLiked: $isLiked, ')
          ..write('isBookmarked: $isBookmarked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, code, tagsJson, isLiked, isBookmarked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SnippetTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.code == this.code &&
          other.tagsJson == this.tagsJson &&
          other.isLiked == this.isLiked &&
          other.isBookmarked == this.isBookmarked);
}

class SnippetTableCompanion extends UpdateCompanion<SnippetTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> code;
  final Value<String> tagsJson;
  final Value<bool> isLiked;
  final Value<bool> isBookmarked;
  const SnippetTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.code = const Value.absent(),
    this.tagsJson = const Value.absent(),
    this.isLiked = const Value.absent(),
    this.isBookmarked = const Value.absent(),
  });
  SnippetTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String code,
    required String tagsJson,
    required bool isLiked,
    required bool isBookmarked,
  }) : title = Value(title),
       code = Value(code),
       tagsJson = Value(tagsJson),
       isLiked = Value(isLiked),
       isBookmarked = Value(isBookmarked);
  static Insertable<SnippetTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? code,
    Expression<String>? tagsJson,
    Expression<bool>? isLiked,
    Expression<bool>? isBookmarked,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (code != null) 'code': code,
      if (tagsJson != null) 'tags_json': tagsJson,
      if (isLiked != null) 'is_liked': isLiked,
      if (isBookmarked != null) 'is_bookmarked': isBookmarked,
    });
  }

  SnippetTableCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? code,
    Value<String>? tagsJson,
    Value<bool>? isLiked,
    Value<bool>? isBookmarked,
  }) {
    return SnippetTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      code: code ?? this.code,
      tagsJson: tagsJson ?? this.tagsJson,
      isLiked: isLiked ?? this.isLiked,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (tagsJson.present) {
      map['tags_json'] = Variable<String>(tagsJson.value);
    }
    if (isLiked.present) {
      map['is_liked'] = Variable<bool>(isLiked.value);
    }
    if (isBookmarked.present) {
      map['is_bookmarked'] = Variable<bool>(isBookmarked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SnippetTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('code: $code, ')
          ..write('tagsJson: $tagsJson, ')
          ..write('isLiked: $isLiked, ')
          ..write('isBookmarked: $isBookmarked')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TagTableTable tagTable = $TagTableTable(this);
  late final $SnippetTableTable snippetTable = $SnippetTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tagTable, snippetTable];
}

typedef $$TagTableTableCreateCompanionBuilder =
    TagTableCompanion Function({
      Value<int> id,
      required String title,
      required String color,
    });
typedef $$TagTableTableUpdateCompanionBuilder =
    TagTableCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> color,
    });

class $$TagTableTableFilterComposer
    extends Composer<_$AppDatabase, $TagTableTable> {
  $$TagTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TagTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TagTableTable> {
  $$TagTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TagTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagTableTable> {
  $$TagTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);
}

class $$TagTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TagTableTable,
          TagTableData,
          $$TagTableTableFilterComposer,
          $$TagTableTableOrderingComposer,
          $$TagTableTableAnnotationComposer,
          $$TagTableTableCreateCompanionBuilder,
          $$TagTableTableUpdateCompanionBuilder,
          (
            TagTableData,
            BaseReferences<_$AppDatabase, $TagTableTable, TagTableData>,
          ),
          TagTableData,
          PrefetchHooks Function()
        > {
  $$TagTableTableTableManager(_$AppDatabase db, $TagTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TagTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TagTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TagTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> color = const Value.absent(),
              }) => TagTableCompanion(id: id, title: title, color: color),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String color,
              }) =>
                  TagTableCompanion.insert(id: id, title: title, color: color),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TagTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TagTableTable,
      TagTableData,
      $$TagTableTableFilterComposer,
      $$TagTableTableOrderingComposer,
      $$TagTableTableAnnotationComposer,
      $$TagTableTableCreateCompanionBuilder,
      $$TagTableTableUpdateCompanionBuilder,
      (
        TagTableData,
        BaseReferences<_$AppDatabase, $TagTableTable, TagTableData>,
      ),
      TagTableData,
      PrefetchHooks Function()
    >;
typedef $$SnippetTableTableCreateCompanionBuilder =
    SnippetTableCompanion Function({
      Value<int> id,
      required String title,
      required String code,
      required String tagsJson,
      required bool isLiked,
      required bool isBookmarked,
    });
typedef $$SnippetTableTableUpdateCompanionBuilder =
    SnippetTableCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> code,
      Value<String> tagsJson,
      Value<bool> isLiked,
      Value<bool> isBookmarked,
    });

class $$SnippetTableTableFilterComposer
    extends Composer<_$AppDatabase, $SnippetTableTable> {
  $$SnippetTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagsJson => $composableBuilder(
    column: $table.tagsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLiked => $composableBuilder(
    column: $table.isLiked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SnippetTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SnippetTableTable> {
  $$SnippetTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagsJson => $composableBuilder(
    column: $table.tagsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLiked => $composableBuilder(
    column: $table.isLiked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SnippetTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SnippetTableTable> {
  $$SnippetTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get tagsJson =>
      $composableBuilder(column: $table.tagsJson, builder: (column) => column);

  GeneratedColumn<bool> get isLiked =>
      $composableBuilder(column: $table.isLiked, builder: (column) => column);

  GeneratedColumn<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => column,
  );
}

class $$SnippetTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SnippetTableTable,
          SnippetTableData,
          $$SnippetTableTableFilterComposer,
          $$SnippetTableTableOrderingComposer,
          $$SnippetTableTableAnnotationComposer,
          $$SnippetTableTableCreateCompanionBuilder,
          $$SnippetTableTableUpdateCompanionBuilder,
          (
            SnippetTableData,
            BaseReferences<_$AppDatabase, $SnippetTableTable, SnippetTableData>,
          ),
          SnippetTableData,
          PrefetchHooks Function()
        > {
  $$SnippetTableTableTableManager(_$AppDatabase db, $SnippetTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SnippetTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SnippetTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$SnippetTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> tagsJson = const Value.absent(),
                Value<bool> isLiked = const Value.absent(),
                Value<bool> isBookmarked = const Value.absent(),
              }) => SnippetTableCompanion(
                id: id,
                title: title,
                code: code,
                tagsJson: tagsJson,
                isLiked: isLiked,
                isBookmarked: isBookmarked,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String code,
                required String tagsJson,
                required bool isLiked,
                required bool isBookmarked,
              }) => SnippetTableCompanion.insert(
                id: id,
                title: title,
                code: code,
                tagsJson: tagsJson,
                isLiked: isLiked,
                isBookmarked: isBookmarked,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SnippetTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SnippetTableTable,
      SnippetTableData,
      $$SnippetTableTableFilterComposer,
      $$SnippetTableTableOrderingComposer,
      $$SnippetTableTableAnnotationComposer,
      $$SnippetTableTableCreateCompanionBuilder,
      $$SnippetTableTableUpdateCompanionBuilder,
      (
        SnippetTableData,
        BaseReferences<_$AppDatabase, $SnippetTableTable, SnippetTableData>,
      ),
      SnippetTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TagTableTableTableManager get tagTable =>
      $$TagTableTableTableManager(_db, _db.tagTable);
  $$SnippetTableTableTableManager get snippetTable =>
      $$SnippetTableTableTableManager(_db, _db.snippetTable);
}
