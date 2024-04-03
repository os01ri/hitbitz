import 'dart:convert';

import 'package:hitbitz/features/home/data/models/category_model.dart';

List<RoadMapModel> roadMapsListFromJson(dynamic decodedJson) =>
    List<RoadMapModel>.from(decodedJson.map((x) => RoadMapModel.fromJson(x)));

String roadMapModelToJson(List<RoadMapModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoadMapModel {
  final int? id;
  final Media? media;
  final String? name;
  final String? description;
  final CategoryModel? category;
  final int? rate;

  RoadMapModel({
    this.id,
    this.media,
    this.name,
    this.description,
    this.category,
    this.rate,
  });

  factory RoadMapModel.fromJson(Map<String, dynamic> json) => RoadMapModel(
        id: json['id'],
        media: json['media'] == null ? null : Media.fromJson(json['media']),
        name: json['name'],
        description: json['description'],
        category: json['category'] == null
            ? null
            : CategoryModel.fromJson(json['category']),
        rate: json['rate'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'media': media?.toJson(),
        'name': name,
        'description': description,
        'category': category?.toJson(),
        'rate': rate,
      };
}

class Media {
  final int? id;
  final String? mediaUrl;
  final String? hash;
  final int? order;

  Media({
    this.id,
    this.mediaUrl,
    this.hash,
    this.order,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json['id'],
        mediaUrl: json['media_url'],
        hash: json['hash'],
        order: json['order'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'media_url': mediaUrl,
        'hash': hash,
        'order': order,
      };
}
