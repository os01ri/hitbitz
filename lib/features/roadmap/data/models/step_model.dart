List<StepModel> stepModelFromJson(dynamic decodedJson) => List<StepModel>.from(decodedJson.map((x) => StepModel.fromJson(x)));

class StepModel {
  final int? id;
  final String? name;
  final String? description;
  final int? order;
  final int? durationInDays;

  StepModel({
    this.id,
    this.name,
    this.description,
    this.order,
    this.durationInDays,
  }); 
  factory StepModel.fromJson(Map<String, dynamic> json) => StepModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        order: json['order'],
        durationInDays: json['duration'],
      );
}
