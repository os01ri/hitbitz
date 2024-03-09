import 'dart:convert';

List<RoadMapModel> roadMapsListFromJson(dynamic decodedJson) => List<RoadMapModel>.from(decodedJson.map((x) => RoadMapModel.fromJson(x)));

String roadMapModelToJson(List<RoadMapModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoadMapModel {
  final int id;
  final String? name;
  final int? subcategoryId;
  final int? rate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? description;

  const RoadMapModel({
    required this.id,
    this.name,
    this.subcategoryId,
    this.rate,
    this.createdAt,
    this.updatedAt,
    this.description,
  });

  RoadMapModel copyWith({
    int? id,
    String? name,
    int? subcategoryId,
    int? rate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? description,
  }) =>
      RoadMapModel(
        id: id ?? this.id,
        name: name ?? this.name,
        subcategoryId: subcategoryId ?? this.subcategoryId,
        rate: rate ?? this.rate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        description: description ?? this.description,
      );

  factory RoadMapModel.fromJson(Map<String, dynamic> json) => RoadMapModel(
        id: json['id'],
        name: json['name'],
        subcategoryId: json['subcategory_id'],
        rate: json['rate'],
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'subcategory_id': subcategoryId,
        'rate': rate,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'description': description,
      };
}
