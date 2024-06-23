import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/features/quiz/data/models/quiz_model.dart';
import 'package:hitbitz/features/quiz/domain/usecases/complete_quiz_usecase.dart';
import 'package:hitbitz/features/quiz/domain/usecases/get_quizzes_usecase.dart';
import 'package:hitbitz/features/quiz/domain/usecases/show_quiz_usecase.dart';
import 'package:injectable/injectable.dart';

part 'quiz_state.dart';

@lazySingleton
class QuizCubit extends Cubit<QuizState> {
  final GetQuizzesUsecase _getQuizzesUsecase;
  final ShowQuizUsecase _showQuizUsecase;
  final CompleteQuizUsecase _completeQuizUsecase;

  QuizCubit({
    required GetQuizzesUsecase getQuizzesUsecase,
    required ShowQuizUsecase showQuizUsecase,
    required CompleteQuizUsecase completeQuizUsecase,
  })  : _getQuizzesUsecase = getQuizzesUsecase,
        _showQuizUsecase = showQuizUsecase,
        _completeQuizUsecase = completeQuizUsecase,
        super(const QuizState());

  getQuizzes(GetQuizzedParams params) async {
    emit(state.copyWith(getStatus: CubitStatus.loading));

    final result = await _getQuizzesUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(getStatus: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(getStatus: CubitStatus.success, quizzes: r)),
    );
  }

  showQuiz(int id) async {
    emit(state.copyWith(showStatus: CubitStatus.loading));

    final result = await _showQuizUsecase(id);

    result.fold(
      (l) => emit(state.copyWith(showStatus: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(showStatus: CubitStatus.success, quiz: r)),
    );
  }

  completeQuiz(CompleteQuizParams params) async {
    emit(state.copyWith(completeStatus: CubitStatus.loading));

    final result = await _completeQuizUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(completeStatus: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(completeStatus: CubitStatus.success)),
    );
  }
}
