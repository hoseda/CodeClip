import 'dart:convert';

class SnippetModel {
  final int id;
  final String name;
  final String code;
  final Set<int> tags;

  SnippetModel({
    required this.id,
    required this.name,
    required this.code,
    required this.tags,
  });

  @override
  String toString() {
    return "SnippetModel {id:$id , Name:$name , tags:$tags , code:$code}";
  }

  SnippetModel copyWith({int? id, String? name, String? code, Set<int>? tags}) {
    return SnippetModel(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'tags': tags,
    };
  }

  factory SnippetModel.fromMap(Map<String, dynamic> map) {
    return SnippetModel(
      id: map['id'] as int,
      name: map['name'] as String,
      code: map['code'] as String,
      tags: map['tags'] as Set<int>,
    );
  }

  String toJson() => json.encode(toMap());

  factory SnippetModel.fromJson(String source) =>
      SnippetModel.fromMap(json.encode(source) as Map<String, dynamic>);
}
