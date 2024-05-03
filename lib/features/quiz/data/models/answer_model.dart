class AnswerModel {
  final int id;
  final String? title;
  final int? order;
  final bool isCorrect;

  const AnswerModel({
    required this.id,
    required this.isCorrect,
    this.title,
    this.order,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) => AnswerModel(
        id: json['id'],
        title: json['title'],
        order: json['order'],
        isCorrect: json['correct'] == 1,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'order': order,
        'correct': isCorrect,
      };
}
