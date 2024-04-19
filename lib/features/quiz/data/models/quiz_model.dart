import 'package:hitbitz/features/quiz/data/models/question_model.dart';

List<QuizModel> quizModelFromJson(dynamic decodedJson) => List<QuizModel>.from(decodedJson.map((x) => QuizModel.fromJson(x)));

class QuizModel {
  final int? id;
  final int? stepId;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<QuestionModel>? questions;

  const QuizModel({
    this.id,
    this.stepId,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.questions,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        id: json['id'],
        stepId: json['step_id'],
        name: json['name'],
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
        questions: json['questions'] == null ? [] : List<QuestionModel>.from(json['questions']!.map((x) => QuestionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'level_detail_id': stepId,
        'name': name,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'questions': questions == null ? [] : List<dynamic>.from(questions!.map((x) => x.toJson())),
      };
}
