part of 'quiz_cubit.dart';

class QuizState {
  final CubitStatus getStatus;
  final List<QuizModel> quizzes;
  final Failure? failure;

  const QuizState({
    this.getStatus = CubitStatus.initial,
    this.quizzes = const [],
    this.failure,
  });

  QuizState copyWith({
    CubitStatus? getStatus,
    List<QuizModel>? quizzes,
    Failure? failure,
  }) {
    return QuizState(
      getStatus: getStatus ?? this.getStatus,
      quizzes: quizzes ?? this.quizzes,
      failure: failure ?? this.failure,
    );
  }
}
