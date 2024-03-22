import 'dart:convert';

import 'package:hitbitz/features/roadmap/data/models/level_model.dart';

List<StepModel> stepModelFromJson(dynamic decodedJson) => List<StepModel>.from(decodedJson.map((x) => StepModel.fromJson(x)));

String stepModelToJson(StepModel data) => json.encode(data.toJson());

class StepModel {
  final int? id;
  final int? levelId;
  final String? name;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final LevelModel? level;

  StepModel({
    this.id,
    this.levelId,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.level,
  });

  StepModel copyWith({
    int? id,
    int? levelId,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    LevelModel? level,
  }) =>
      StepModel(
        id: id ?? this.id,
        levelId: levelId ?? this.levelId,
        name: name ?? this.name,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        level: level ?? this.level,
      );

  factory StepModel.fromJson(Map<String, dynamic> json) => StepModel(
        id: json['id'],
        levelId: json['level_id'],
        name: json['name'],
        description: json['description'],
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
        level: json['level'] == null ? null : LevelModel.fromJson(json['level']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'level_id': levelId,
        'name': name,
        'description': description,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'level': level?.toJson(),
      };
}
