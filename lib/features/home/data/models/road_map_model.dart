import 'package:hitbitz/core/data/models/media_model.dart';
import 'package:hitbitz/features/home/data/models/category_model.dart';
import 'package:hitbitz/features/roadmap/data/models/level_model.dart';

List<RoadMapModel> roadMapsListFromJson(dynamic decodedJson) => List<RoadMapModel>.from(decodedJson.map((x) => RoadMapModel.fromJson(x)));

class RoadMapModel {
  final int? id;
  final MediaModel? media;
  final String? name;
  final String? description;
  final int? rate;
  final int? duration;
  final List<LevelModel>? levels;
  final CategoryModel? category;
  final int? currentLevel;
  final int? currentStep;
  final int? completed;

  const RoadMapModel({
    this.id,
    this.media,
    this.name,
    this.description,
    this.rate,
    this.duration,
    this.levels,
    this.category,
    this.currentLevel,
    this.currentStep,
    this.completed,
  });

  factory RoadMapModel.fromJson(Map<String, dynamic> json) => RoadMapModel(
        id: json['id'],
        media: json['media'] == null ? null : MediaModel.fromJson(json['media']),
        name: json['name'],
        description: json['description'],
        rate: json['rate'],
        duration: json['duration'],
        levels: json['levels'] == null ? [] : List<LevelModel>.from(json['levels']!.map((x) => LevelModel.fromJson(x))),
        category: json['category'] == null ? null : CategoryModel.fromJson(json['category']),
        currentLevel: json['current_level'],
        currentStep: json['current_step'],
        completed: json['completed'],
      );
}
