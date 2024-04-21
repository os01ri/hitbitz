// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quiz_cubit.dart';

class QuizState {
  final CubitStatus getStatus;
  final List<QuizModel> quizzes;
  final CubitStatus showStatus;
  final QuizModel? quiz;
  final Failure? failure;

  const QuizState({
    this.getStatus = CubitStatus.initial,
    this.quizzes = const [],
    this.showStatus = CubitStatus.initial,
    this.quiz,
    this.failure,
  });

  QuizState copyWith({
    CubitStatus? getStatus,
    List<QuizModel>? quizzes,
    CubitStatus? showStatus,
    QuizModel? quiz,
    Failure? failure,
  }) {
    return QuizState(
      getStatus: getStatus ?? this.getStatus,
      quizzes: quizzes ?? this.quizzes,
      showStatus: showStatus ?? this.showStatus,
      quiz: quiz ?? this.quiz,
      failure: failure ?? this.failure,
    );
  }
}
