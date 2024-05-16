import 'package:hitbitz/features/quiz/data/models/question_model.dart';

List<QuizModel> quizModelFromJson(dynamic decodedJson) => List<QuizModel>.from(decodedJson.map((x) => QuizModel.fromJson(x)));

class QuizModel {
  final int id;
  final int? stepId;
  final String? name;
  final double? requiredDegree;
  final String ? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<QuestionModel> questions;

  const QuizModel({
    required this.id,
    this.stepId,
    this.name,
    this.requiredDegree,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.questions = const [],
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        id: json['id'],
        stepId: json['step_id'],
        name: json['name'],
        description: json['description'],
        requiredDegree: json['required_degree'] == null ? null : (json['required_degree'] as num).toDouble(),
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
        questions: json['questions'] == null ? [] : List<QuestionModel>.from(json['questions']!.map((x) => QuestionModel.fromJson(x))),
      );
}
