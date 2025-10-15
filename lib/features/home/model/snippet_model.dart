import 'dart:convert';

class SnippetModel {
  final int id;
  final String name;
  final String code;
  final Set<int> tagsId;
  final bool isLiked;
  final bool isBookmarked;

  SnippetModel({
    required this.id,
    required this.name,
    required this.code,
    this.tagsId = const {},
    this.isLiked = false,
    this.isBookmarked = false,
  });

  @override
  String toString() {
    return "SnippetModel {id:$id , Name:$name , code:$code}";
  }

  SnippetModel copyWith({
    int? id,
    String? name,
    String? code,
    bool? isLiked,
    bool? isBookmarked,
  }) {
    return SnippetModel(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      isLiked: isLiked ?? this.isLiked,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'isLiked': isLiked,
      'isBookmarked': isBookmarked,
    };
  }

  factory SnippetModel.fromMap(Map<String, dynamic> map) {
    return SnippetModel(
      id: (map['id'] ?? 0) as int,
      name: (map['title'] ?? '') as String,
      code: (map['code'] ?? '') as String,
      isLiked: (map['isLiked'] ?? false) as bool,
      isBookmarked: (map['isBookmarked'] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SnippetModel.fromJson(String source) =>
      SnippetModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension SnippetTools on SnippetModel {
  SnippetModel likeSnippet(SnippetModel snippet) {
    final newSnippet = snippet.copyWith(isLiked: !snippet.isLiked);
    return newSnippet;
  }

  SnippetModel bookMarkSnippet(SnippetModel snippet) {
    final newSnippet = snippet.copyWith(isBookmarked: !snippet.isBookmarked);
    return newSnippet;
  }
}
