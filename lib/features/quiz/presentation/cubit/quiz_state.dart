part of 'quiz_cubit.dart';

class QuizState {
  final CubitStatus getStatus;
  final List<QuizModel> quizzes;
  final CubitStatus showStatus;
  final QuizModel? quiz;
  final CubitStatus completeStatus;
  final Failure? failure;

  const QuizState({
    this.getStatus = CubitStatus.initial,
    this.quizzes = const [],
    this.showStatus = CubitStatus.initial,
    this.quiz,
    this.completeStatus = CubitStatus.initial,
    this.failure,
  });

  QuizState copyWith({
    CubitStatus? getStatus,
    List<QuizModel>? quizzes,
    CubitStatus? showStatus,
    QuizModel? quiz,
    CubitStatus? completeStatus,
    Failure? failure,
  }) {
    return QuizState(
      getStatus: getStatus ?? this.getStatus,
      quizzes: quizzes ?? this.quizzes,
      showStatus: showStatus ?? this.showStatus,
      quiz: quiz ?? this.quiz,
      completeStatus: completeStatus ?? this.completeStatus,
      failure: failure ?? this.failure,
    );
  }
}
