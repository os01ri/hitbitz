List<StepModel> stepModelFromJson(dynamic decodedJson) => List<StepModel>.from(decodedJson.map((x) => StepModel.fromJson(x)));

class StepModel {
  final int? id;
  final String? name;
  final String? description;
  final int? order;
  final int? durationInHours;

  StepModel({
    this.id,
    this.name,
    this.description,
    this.order,
    this.durationInHours,
  }); 
  factory StepModel.fromJson(Map<String, dynamic> json) => StepModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        order: json['order'],
        durationInHours: json['duration'],
      );
}
