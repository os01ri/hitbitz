import 'dart:convert';

import 'package:hitbitz/core/data/models/media_model.dart';

List<CategoryModel> categoriesListFromJson(dynamic decodedJson) =>
    List<CategoryModel>.from(decodedJson.map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  final int? id;
  final String? name;
  final MediaModel? image;
  final int? parentId;
  final String? type;

  CategoryModel({
    this.id,
    this.name,
    this.image,
    this.parentId,
    this.type,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        name: json['name'],
        image: json['image'] == null ? null : MediaModel.fromJson(json['image']),
        parentId: json['parent_id'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image?.toJson(),
        'parent_id': parentId,
        'type': type,
      };
}
