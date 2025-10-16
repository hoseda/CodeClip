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
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    code,
    isLiked,
    isBookmarked,
    isDeleted,
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
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    } else if (isInserting) {
      context.missing(_isDeletedMeta);
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
      isDeleted:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_deleted'],
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
  final bool isLiked;
  final bool isBookmarked;
  final bool isDeleted;
  const SnippetTableData({
    required this.id,
    required this.title,
    required this.code,
    required this.isLiked,
    required this.isBookmarked,
    required this.isDeleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['code'] = Variable<String>(code);
    map['is_liked'] = Variable<bool>(isLiked);
    map['is_bookmarked'] = Variable<bool>(isBookmarked);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  SnippetTableCompanion toCompanion(bool nullToAbsent) {
    return SnippetTableCompanion(
      id: Value(id),
      title: Value(title),
      code: Value(code),
      isLiked: Value(isLiked),
      isBookmarked: Value(isBookmarked),
      isDeleted: Value(isDeleted),
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
      isLiked: serializer.fromJson<bool>(json['isLiked']),
      isBookmarked: serializer.fromJson<bool>(json['isBookmarked']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'code': serializer.toJson<String>(code),
      'isLiked': serializer.toJson<bool>(isLiked),
      'isBookmarked': serializer.toJson<bool>(isBookmarked),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  SnippetTableData copyWith({
    int? id,
    String? title,
    String? code,
    bool? isLiked,
    bool? isBookmarked,
    bool? isDeleted,
  }) => SnippetTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    code: code ?? this.code,
    isLiked: isLiked ?? this.isLiked,
    isBookmarked: isBookmarked ?? this.isBookmarked,
    isDeleted: isDeleted ?? this.isDeleted,
  );
  SnippetTableData copyWithCompanion(SnippetTableCompanion data) {
    return SnippetTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      code: data.code.present ? data.code.value : this.code,
      isLiked: data.isLiked.present ? data.isLiked.value : this.isLiked,
      isBookmarked:
          data.isBookmarked.present
              ? data.isBookmarked.value
              : this.isBookmarked,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SnippetTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('code: $code, ')
          ..write('isLiked: $isLiked, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, code, isLiked, isBookmarked, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SnippetTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.code == this.code &&
          other.isLiked == this.isLiked &&
          other.isBookmarked == this.isBookmarked &&
          other.isDeleted == this.isDeleted);
}

class SnippetTableCompanion extends UpdateCompanion<SnippetTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> code;
  final Value<bool> isLiked;
  final Value<bool> isBookmarked;
  final Value<bool> isDeleted;
  const SnippetTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.code = const Value.absent(),
    this.isLiked = const Value.absent(),
    this.isBookmarked = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  SnippetTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String code,
    required bool isLiked,
    required bool isBookmarked,
    required bool isDeleted,
  }) : title = Value(title),
       code = Value(code),
       isLiked = Value(isLiked),
       isBookmarked = Value(isBookmarked),
       isDeleted = Value(isDeleted);
  static Insertable<SnippetTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? code,
    Expression<bool>? isLiked,
    Expression<bool>? isBookmarked,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (code != null) 'code': code,
      if (isLiked != null) 'is_liked': isLiked,
      if (isBookmarked != null) 'is_bookmarked': isBookmarked,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  SnippetTableCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? code,
    Value<bool>? isLiked,
    Value<bool>? isBookmarked,
    Value<bool>? isDeleted,
  }) {
    return SnippetTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      code: code ?? this.code,
      isLiked: isLiked ?? this.isLiked,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      isDeleted: isDeleted ?? this.isDeleted,
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
    if (isLiked.present) {
      map['is_liked'] = Variable<bool>(isLiked.value);
    }
    if (isBookmarked.present) {
      map['is_bookmarked'] = Variable<bool>(isBookmarked.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SnippetTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('code: $code, ')
          ..write('isLiked: $isLiked, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $SnippetTagTableTable extends SnippetTagTable
    with TableInfo<$SnippetTagTableTable, SnippetTagTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SnippetTagTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _snippetIdMeta = const VerificationMeta(
    'snippetId',
  );
  @override
  late final GeneratedColumn<int> snippetId = GeneratedColumn<int>(
    'snippet_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES snippet_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
    'tag_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tag_table (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [snippetId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'snippet_tag_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SnippetTagTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('snippet_id')) {
      context.handle(
        _snippetIdMeta,
        snippetId.isAcceptableOrUnknown(data['snippet_id']!, _snippetIdMeta),
      );
    } else if (isInserting) {
      context.missing(_snippetIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SnippetTagTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SnippetTagTableData(
      snippetId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}snippet_id'],
          )!,
      tagId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}tag_id'],
          )!,
    );
  }

  @override
  $SnippetTagTableTable createAlias(String alias) {
    return $SnippetTagTableTable(attachedDatabase, alias);
  }
}

class SnippetTagTableData extends DataClass
    implements Insertable<SnippetTagTableData> {
  final int snippetId;
  final int tagId;
  const SnippetTagTableData({required this.snippetId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['snippet_id'] = Variable<int>(snippetId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  SnippetTagTableCompanion toCompanion(bool nullToAbsent) {
    return SnippetTagTableCompanion(
      snippetId: Value(snippetId),
      tagId: Value(tagId),
    );
  }

  factory SnippetTagTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SnippetTagTableData(
      snippetId: serializer.fromJson<int>(json['snippetId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'snippetId': serializer.toJson<int>(snippetId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  SnippetTagTableData copyWith({int? snippetId, int? tagId}) =>
      SnippetTagTableData(
        snippetId: snippetId ?? this.snippetId,
        tagId: tagId ?? this.tagId,
      );
  SnippetTagTableData copyWithCompanion(SnippetTagTableCompanion data) {
    return SnippetTagTableData(
      snippetId: data.snippetId.present ? data.snippetId.value : this.snippetId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SnippetTagTableData(')
          ..write('snippetId: $snippetId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(snippetId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SnippetTagTableData &&
          other.snippetId == this.snippetId &&
          other.tagId == this.tagId);
}

class SnippetTagTableCompanion extends UpdateCompanion<SnippetTagTableData> {
  final Value<int> snippetId;
  final Value<int> tagId;
  final Value<int> rowid;
  const SnippetTagTableCompanion({
    this.snippetId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SnippetTagTableCompanion.insert({
    required int snippetId,
    required int tagId,
    this.rowid = const Value.absent(),
  }) : snippetId = Value(snippetId),
       tagId = Value(tagId);
  static Insertable<SnippetTagTableData> custom({
    Expression<int>? snippetId,
    Expression<int>? tagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (snippetId != null) 'snippet_id': snippetId,
      if (tagId != null) 'tag_id': tagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SnippetTagTableCompanion copyWith({
    Value<int>? snippetId,
    Value<int>? tagId,
    Value<int>? rowid,
  }) {
    return SnippetTagTableCompanion(
      snippetId: snippetId ?? this.snippetId,
      tagId: tagId ?? this.tagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (snippetId.present) {
      map['snippet_id'] = Variable<int>(snippetId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SnippetTagTableCompanion(')
          ..write('snippetId: $snippetId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TagTableTable tagTable = $TagTableTable(this);
  late final $SnippetTableTable snippetTable = $SnippetTableTable(this);
  late final $SnippetTagTableTable snippetTagTable = $SnippetTagTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    tagTable,
    snippetTable,
    snippetTagTable,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'snippet_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('snippet_tag_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tag_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('snippet_tag_table', kind: UpdateKind.delete)],
    ),
  ]);
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

final class $$TagTableTableReferences
    extends BaseReferences<_$AppDatabase, $TagTableTable, TagTableData> {
  $$TagTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SnippetTagTableTable, List<SnippetTagTableData>>
  _snippetTagTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.snippetTagTable,
    aliasName: $_aliasNameGenerator(db.tagTable.id, db.snippetTagTable.tagId),
  );

  $$SnippetTagTableTableProcessedTableManager get snippetTagTableRefs {
    final manager = $$SnippetTagTableTableTableManager(
      $_db,
      $_db.snippetTagTable,
    ).filter((f) => f.tagId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _snippetTagTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  Expression<bool> snippetTagTableRefs(
    Expression<bool> Function($$SnippetTagTableTableFilterComposer f) f,
  ) {
    final $$SnippetTagTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.snippetTagTable,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SnippetTagTableTableFilterComposer(
            $db: $db,
            $table: $db.snippetTagTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  Expression<T> snippetTagTableRefs<T extends Object>(
    Expression<T> Function($$SnippetTagTableTableAnnotationComposer a) f,
  ) {
    final $$SnippetTagTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.snippetTagTable,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SnippetTagTableTableAnnotationComposer(
            $db: $db,
            $table: $db.snippetTagTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
          (TagTableData, $$TagTableTableReferences),
          TagTableData,
          PrefetchHooks Function({bool snippetTagTableRefs})
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
                          $$TagTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({snippetTagTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (snippetTagTableRefs) db.snippetTagTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (snippetTagTableRefs)
                    await $_getPrefetchedData<
                      TagTableData,
                      $TagTableTable,
                      SnippetTagTableData
                    >(
                      currentTable: table,
                      referencedTable: $$TagTableTableReferences
                          ._snippetTagTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$TagTableTableReferences(
                                db,
                                table,
                                p0,
                              ).snippetTagTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.tagId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (TagTableData, $$TagTableTableReferences),
      TagTableData,
      PrefetchHooks Function({bool snippetTagTableRefs})
    >;
typedef $$SnippetTableTableCreateCompanionBuilder =
    SnippetTableCompanion Function({
      Value<int> id,
      required String title,
      required String code,
      required bool isLiked,
      required bool isBookmarked,
      required bool isDeleted,
    });
typedef $$SnippetTableTableUpdateCompanionBuilder =
    SnippetTableCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> code,
      Value<bool> isLiked,
      Value<bool> isBookmarked,
      Value<bool> isDeleted,
    });

final class $$SnippetTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $SnippetTableTable, SnippetTableData> {
  $$SnippetTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SnippetTagTableTable, List<SnippetTagTableData>>
  _snippetTagTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.snippetTagTable,
    aliasName: $_aliasNameGenerator(
      db.snippetTable.id,
      db.snippetTagTable.snippetId,
    ),
  );

  $$SnippetTagTableTableProcessedTableManager get snippetTagTableRefs {
    final manager = $$SnippetTagTableTableTableManager(
      $_db,
      $_db.snippetTagTable,
    ).filter((f) => f.snippetId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _snippetTagTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  ColumnFilters<bool> get isLiked => $composableBuilder(
    column: $table.isLiked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> snippetTagTableRefs(
    Expression<bool> Function($$SnippetTagTableTableFilterComposer f) f,
  ) {
    final $$SnippetTagTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.snippetTagTable,
      getReferencedColumn: (t) => t.snippetId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SnippetTagTableTableFilterComposer(
            $db: $db,
            $table: $db.snippetTagTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  ColumnOrderings<bool> get isLiked => $composableBuilder(
    column: $table.isLiked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
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

  GeneratedColumn<bool> get isLiked =>
      $composableBuilder(column: $table.isLiked, builder: (column) => column);

  GeneratedColumn<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  Expression<T> snippetTagTableRefs<T extends Object>(
    Expression<T> Function($$SnippetTagTableTableAnnotationComposer a) f,
  ) {
    final $$SnippetTagTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.snippetTagTable,
      getReferencedColumn: (t) => t.snippetId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SnippetTagTableTableAnnotationComposer(
            $db: $db,
            $table: $db.snippetTagTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
          (SnippetTableData, $$SnippetTableTableReferences),
          SnippetTableData,
          PrefetchHooks Function({bool snippetTagTableRefs})
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
                Value<bool> isLiked = const Value.absent(),
                Value<bool> isBookmarked = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
              }) => SnippetTableCompanion(
                id: id,
                title: title,
                code: code,
                isLiked: isLiked,
                isBookmarked: isBookmarked,
                isDeleted: isDeleted,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String code,
                required bool isLiked,
                required bool isBookmarked,
                required bool isDeleted,
              }) => SnippetTableCompanion.insert(
                id: id,
                title: title,
                code: code,
                isLiked: isLiked,
                isBookmarked: isBookmarked,
                isDeleted: isDeleted,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$SnippetTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({snippetTagTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (snippetTagTableRefs) db.snippetTagTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (snippetTagTableRefs)
                    await $_getPrefetchedData<
                      SnippetTableData,
                      $SnippetTableTable,
                      SnippetTagTableData
                    >(
                      currentTable: table,
                      referencedTable: $$SnippetTableTableReferences
                          ._snippetTagTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$SnippetTableTableReferences(
                                db,
                                table,
                                p0,
                              ).snippetTagTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.snippetId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (SnippetTableData, $$SnippetTableTableReferences),
      SnippetTableData,
      PrefetchHooks Function({bool snippetTagTableRefs})
    >;
typedef $$SnippetTagTableTableCreateCompanionBuilder =
    SnippetTagTableCompanion Function({
      required int snippetId,
      required int tagId,
      Value<int> rowid,
    });
typedef $$SnippetTagTableTableUpdateCompanionBuilder =
    SnippetTagTableCompanion Function({
      Value<int> snippetId,
      Value<int> tagId,
      Value<int> rowid,
    });

final class $$SnippetTagTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SnippetTagTableTable,
          SnippetTagTableData
        > {
  $$SnippetTagTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SnippetTableTable _snippetIdTable(_$AppDatabase db) =>
      db.snippetTable.createAlias(
        $_aliasNameGenerator(db.snippetTagTable.snippetId, db.snippetTable.id),
      );

  $$SnippetTableTableProcessedTableManager get snippetId {
    final $_column = $_itemColumn<int>('snippet_id')!;

    final manager = $$SnippetTableTableTableManager(
      $_db,
      $_db.snippetTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_snippetIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TagTableTable _tagIdTable(_$AppDatabase db) =>
      db.tagTable.createAlias(
        $_aliasNameGenerator(db.snippetTagTable.tagId, db.tagTable.id),
      );

  $$TagTableTableProcessedTableManager get tagId {
    final $_column = $_itemColumn<int>('tag_id')!;

    final manager = $$TagTableTableTableManager(
      $_db,
      $_db.tagTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SnippetTagTableTableFilterComposer
    extends Composer<_$AppDatabase, $SnippetTagTableTable> {
  $$SnippetTagTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$SnippetTableTableFilterComposer get snippetId {
    final $$SnippetTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.snippetId,
      referencedTable: $db.snippetTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SnippetTableTableFilterComposer(
            $db: $db,
            $table: $db.snippetTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagTableTableFilterComposer get tagId {
    final $$TagTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tagTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagTableTableFilterComposer(
            $db: $db,
            $table: $db.tagTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SnippetTagTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SnippetTagTableTable> {
  $$SnippetTagTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$SnippetTableTableOrderingComposer get snippetId {
    final $$SnippetTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.snippetId,
      referencedTable: $db.snippetTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SnippetTableTableOrderingComposer(
            $db: $db,
            $table: $db.snippetTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagTableTableOrderingComposer get tagId {
    final $$TagTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tagTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagTableTableOrderingComposer(
            $db: $db,
            $table: $db.tagTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SnippetTagTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SnippetTagTableTable> {
  $$SnippetTagTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$SnippetTableTableAnnotationComposer get snippetId {
    final $$SnippetTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.snippetId,
      referencedTable: $db.snippetTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SnippetTableTableAnnotationComposer(
            $db: $db,
            $table: $db.snippetTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagTableTableAnnotationComposer get tagId {
    final $$TagTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tagTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagTableTableAnnotationComposer(
            $db: $db,
            $table: $db.tagTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SnippetTagTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SnippetTagTableTable,
          SnippetTagTableData,
          $$SnippetTagTableTableFilterComposer,
          $$SnippetTagTableTableOrderingComposer,
          $$SnippetTagTableTableAnnotationComposer,
          $$SnippetTagTableTableCreateCompanionBuilder,
          $$SnippetTagTableTableUpdateCompanionBuilder,
          (SnippetTagTableData, $$SnippetTagTableTableReferences),
          SnippetTagTableData,
          PrefetchHooks Function({bool snippetId, bool tagId})
        > {
  $$SnippetTagTableTableTableManager(
    _$AppDatabase db,
    $SnippetTagTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$SnippetTagTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SnippetTagTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$SnippetTagTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> snippetId = const Value.absent(),
                Value<int> tagId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SnippetTagTableCompanion(
                snippetId: snippetId,
                tagId: tagId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int snippetId,
                required int tagId,
                Value<int> rowid = const Value.absent(),
              }) => SnippetTagTableCompanion.insert(
                snippetId: snippetId,
                tagId: tagId,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$SnippetTagTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({snippetId = false, tagId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (snippetId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.snippetId,
                            referencedTable: $$SnippetTagTableTableReferences
                                ._snippetIdTable(db),
                            referencedColumn:
                                $$SnippetTagTableTableReferences
                                    ._snippetIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (tagId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.tagId,
                            referencedTable: $$SnippetTagTableTableReferences
                                ._tagIdTable(db),
                            referencedColumn:
                                $$SnippetTagTableTableReferences
                                    ._tagIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SnippetTagTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SnippetTagTableTable,
      SnippetTagTableData,
      $$SnippetTagTableTableFilterComposer,
      $$SnippetTagTableTableOrderingComposer,
      $$SnippetTagTableTableAnnotationComposer,
      $$SnippetTagTableTableCreateCompanionBuilder,
      $$SnippetTagTableTableUpdateCompanionBuilder,
      (SnippetTagTableData, $$SnippetTagTableTableReferences),
      SnippetTagTableData,
      PrefetchHooks Function({bool snippetId, bool tagId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TagTableTableTableManager get tagTable =>
      $$TagTableTableTableManager(_db, _db.tagTable);
  $$SnippetTableTableTableManager get snippetTable =>
      $$SnippetTableTableTableManager(_db, _db.snippetTable);
  $$SnippetTagTableTableTableManager get snippetTagTable =>
      $$SnippetTagTableTableTableManager(_db, _db.snippetTagTable);
}
