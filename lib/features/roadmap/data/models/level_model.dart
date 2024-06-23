import 'package:hitbitz/features/home/data/models/road_map_model.dart';

List<LevelModel> levelsListFromJson(dynamic decodedJson) => List<LevelModel>.from(decodedJson.map((x) => LevelModel.fromJson(x)));

class LevelModel {
  final int id;
  final String? name;
  final int? order;
  final RoadMapModel? roadmap;

  const LevelModel({
    required this.id,
    this.name,
    this.order,
    this.roadmap,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) => LevelModel(
        id: json['id'],
        name: json['name'],
        order: json['order'],
        roadmap: json['roadmap'],
      );
}
