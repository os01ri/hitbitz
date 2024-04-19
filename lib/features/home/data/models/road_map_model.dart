import 'dart:convert';

import 'package:hitbitz/core/data/models/media_model.dart';
import 'package:hitbitz/features/home/data/models/category_model.dart';

List<RoadMapModel> roadMapsListFromJson(dynamic decodedJson) => List<RoadMapModel>.from(decodedJson.map((x) => RoadMapModel.fromJson(x)));

String roadMapModelToJson(List<RoadMapModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoadMapModel {
  final int? id;
  final String? name;
  final String? description;
  final MediaModel? media;
  final int? rate;
  final CategoryModel? category;

  RoadMapModel({
    this.id,
    this.name,
    this.description,
    this.rate,
    this.media,
    this.category,
  });

  factory RoadMapModel.fromJson(Map<String, dynamic> json) => RoadMapModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        rate: json['rate'],
        media: json['media'] == null ? null : MediaModel.fromJson(json['media']),
        category: json['category'] == null ? null : CategoryModel.fromJson(json['category']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'rate': rate,
        'media': media?.toJson(),
        'category': category?.toJson(),
      };
}
