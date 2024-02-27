import 'dart:convert';

List<CategoryModel> categoryModelFromJson(dynamic decodedJson) =>
    List<CategoryModel>.from(decodedJson.map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  final int id;
  final String? name;
  final int? typeId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CategoryModel({
    required this.id,
    this.name,
    this.typeId,
    this.createdAt,
    this.updatedAt,
  });

  CategoryModel copyWith({
    int? id,
    String? name,
    int? typeId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        typeId: typeId ?? this.typeId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        name: json['name'],
        typeId: json['type_id'],
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type_id': typeId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
