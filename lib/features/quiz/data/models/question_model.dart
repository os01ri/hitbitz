import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/data/models/media_model.dart';
import 'package:hitbitz/features/quiz/data/enums/question_type.dart';
import 'package:hitbitz/features/quiz/data/models/answer_model.dart';

class QuestionModel {
  final int id;
  final QuestionType type;
  final String? title;
  final List<int> correctAnswers;
  final List<MediaModel> media;
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

  String showCorrectAnswers() {
    final answer = switch (type) {
      QuestionType.trueFalse => correctAnswers.first == 1,
      QuestionType.multipleSelect => answers.where((answer) => answer.isCorrect).map((ans) => ans.title).join(', '),
      QuestionType.gapFilling => answers.first.title,
      QuestionType.verticalSorting => answers.sorted((ans1, ans2) => ((ans1.order! >= ans2.order!) ? 1 : -1)),
      QuestionType.horizontalSorting => answers.sorted((ans1, ans2) => ((ans1.order! >= ans2.order!) ? 1 : -1)),
      _ => null,
    }
        .toString();

    return '${AppStrings.correctAnswer.tr()}: $answer';
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json['id'],
        type: QuestionType.getByIndex(json['type']),
        title: json['title'],
        correctAnswers: json['correctAnswer'] == null ? [] : List<int>.from(json['correctAnswer']!.map((x) => x)),
        media: json['media'] == null ? [] : List<MediaModel>.from(json['media']!.map((x) => x)),
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
