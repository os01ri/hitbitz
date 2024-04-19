import 'package:hitbitz/features/quiz/data/models/answer_model.dart';
import 'package:hitbitz/features/quiz/data/models/question_type.dart';

class QuestionModel {
  final int? id;
  final String? title;
  final QuestionType? type;
  final List<int>? correctAnswer;
  final List<dynamic>? media;
  final List<AnswerModel>? answers;

  const QuestionModel({
    this.id,
    this.title,
    this.type,
    this.correctAnswer,
    this.media,
    this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json['id'],
        title: json['title'],
        type: QuestionType.getByIndex(json['type']),
        correctAnswer: json['correctAnswer'] == null ? [] : List<int>.from(json['correctAnswer']!.map((x) => x)),
        media: json['media'] == null ? [] : List<dynamic>.from(json['media']!.map((x) => x)),
        answers: json['answers'] == null ? [] : List<AnswerModel>.from(json['answers']!.map((x) => AnswerModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'type': type?.index,
        'correctAnswer': correctAnswer == null ? [] : List<dynamic>.from(correctAnswer!.map((x) => x)),
        'media': media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
        'answers': answers == null ? [] : List<dynamic>.from(answers!.map((x) => x.toJson())),
      };
}
