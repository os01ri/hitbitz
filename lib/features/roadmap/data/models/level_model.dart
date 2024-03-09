import 'dart:convert';

import 'package:hitbitz/features/home/data/models/road_map_model.dart';

List<LevelModel> levelsListFromJson(dynamic decodedJson) => List<LevelModel>.from(decodedJson.map((x) => LevelModel.fromJson(x)));

String levelModelToJson(LevelModel data) => json.encode(data.toJson());

class LevelModel {
  final int id;
  final int? roadmapId;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final RoadMapModel? roadmap;

  const LevelModel({
    required this.id,
    this.roadmapId,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.roadmap,
  });

  LevelModel copyWith({
    int? id,
    int? roadmapId,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    RoadMapModel? roadmap,
  }) =>
      LevelModel(
        id: id ?? this.id,
        roadmapId: roadmapId ?? this.roadmapId,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        roadmap: roadmap ?? this.roadmap,
      );

  factory LevelModel.fromJson(Map<String, dynamic> json) => LevelModel(
        id: json['id'],
        roadmapId: json['roadmap_id'],
        name: json['name'],
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
        roadmap: json['roadmap'] == null ? null : RoadMapModel.fromJson(json['roadmap']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'roadmap_id': roadmapId,
        'name': name,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'roadmap': roadmap?.toJson(),
      };
}
