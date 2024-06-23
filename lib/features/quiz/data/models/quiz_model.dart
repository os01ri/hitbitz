import 'package:hitbitz/features/quiz/data/models/question_model.dart';

List<QuizModel> quizModelFromJson(dynamic decodedJson) => List<QuizModel>.from(decodedJson.map((x) => QuizModel.fromJson(x)));

class QuizModel {
  final int id;
  final int? stepId;
  final String? name;
  final double? requiredDegree;
  final double? degree;
  final String? description;
  final bool? isCompleted;
  final List<QuestionModel> questions;

  const QuizModel({
    required this.id,
    this.stepId,
    this.name,
    this.requiredDegree,
    this.degree,
    this.description,
    this.isCompleted,
    this.questions = const [],
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        id: json['id'],
        stepId: json['step_id'],
        name: json['name'],
        description: json['description'],
        requiredDegree: json['required_degree'] == null ? null : (json['required_degree'] as num).toDouble(),
        degree: json['degree'] == null ? null : (json['degree'] as num).toDouble(),
        isCompleted: json['completed'] == null ? false : json['completed'] == 1,
        questions: json['questions'] == null ? [] : List<QuestionModel>.from(json['questions']!.map((x) => QuestionModel.fromJson(x))),
      );
}
