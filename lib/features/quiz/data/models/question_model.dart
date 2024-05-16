import 'package:hitbitz/features/quiz/data/enums/question_type.dart';
import 'package:hitbitz/features/quiz/data/models/answer_model.dart';

class QuestionModel {
  final int id;
  final QuestionType type;
  final String? title;
  final List<int> correctAnswers;
  final List<dynamic> media;
  final List<AnswerModel> answers;
  final List<int> userAnswersIds = [];
  bool? isCorrect;

  QuestionModel({
    required this.id,
    required this.type,
    this.title,
    this.correctAnswers = const [],
    this.media = const [],
    this.answers = const [],
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json['id'],
        type: QuestionType.getByIndex(json['type']),
        title: json['title'],
        correctAnswers: json['correctAnswer'] == null ? [] : List<int>.from(json['correctAnswer']!.map((x) => x)),
        media: json['media'] == null ? [] : List<dynamic>.from(json['media']!.map((x) => x)),
        answers: json['answers'] == null ? [] : List<AnswerModel>.from(json['answers']!.map((x) => AnswerModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type.index,
        'title': title,
        'correctAnswer': List<dynamic>.from(correctAnswers.map((x) => x)),
        'media': List<dynamic>.from(media.map((x) => x)),
        'answers': List<dynamic>.from(answers.map((x) => x.toJson())),
      };
}
