import 'dart:convert';

List<LevelModel> levelsListFromJson(dynamic decodedJson) => List<LevelModel>.from(decodedJson.map((x) => LevelModel.fromJson(x)));

String levelModelToJson(LevelModel data) => json.encode(data.toJson());

class LevelModel {
  final int id;
  final int? roadmapId;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const LevelModel({
    required this.id,
    this.roadmapId,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) => LevelModel(
        id: json['id'],
        roadmapId: json['roadmap_id'],
        name: json['name'],
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'roadmap_id': roadmapId,
        'name': name,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
