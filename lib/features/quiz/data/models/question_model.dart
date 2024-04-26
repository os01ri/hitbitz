import 'package:hitbitz/features/quiz/data/enums/question_type.dart';
import 'package:hitbitz/features/quiz/data/models/answer_model.dart';

class QuestionModel {
  final int id;
  final QuestionType type;
  final String? title;
  final List<int>? correctAnswer;
  final List<dynamic>? media;
  final List<AnswerModel>? answers;

  const QuestionModel({
    required this.id,
    required this.type,
    this.title,
    this.correctAnswer,
    this.media,
    this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json['id'],
        type: QuestionType.getByIndex(json['type']),
        title: json['title'],
        correctAnswer: json['correctAnswer'] == null ? [] : List<int>.from(json['correctAnswer']!.map((x) => x)),
        media: json['media'] == null ? [] : List<dynamic>.from(json['media']!.map((x) => x)),
        answers: json['answers'] == null ? [] : List<AnswerModel>.from(json['answers']!.map((x) => AnswerModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type.index,
        'title': title,
        'correctAnswer': correctAnswer == null ? [] : List<dynamic>.from(correctAnswer!.map((x) => x)),
        'media': media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
        'answers': answers == null ? [] : List<dynamic>.from(answers!.map((x) => x.toJson())),
      };
}
