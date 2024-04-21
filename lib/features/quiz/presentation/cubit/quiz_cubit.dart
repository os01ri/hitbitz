import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/quiz/data/models/quiz_model.dart';
import 'package:hitbitz/features/quiz/domain/usecases/get_quizzes_usecase.dart';
import 'package:hitbitz/features/quiz/domain/usecases/show_quiz_usecase.dart';
import 'package:injectable/injectable.dart';

part 'quiz_state.dart';

@lazySingleton
class QuizCubit extends Cubit<QuizState> {
  final GetQuizzesUsecase _getQuizzesUsecase;
  final ShowQuizUsecase _showQuizUsecase;

  QuizCubit({
    required GetQuizzesUsecase getQuizzesUsecase,
    required ShowQuizUsecase showQuizUsecase,
  })  : _getQuizzesUsecase = getQuizzesUsecase,
        _showQuizUsecase = showQuizUsecase,
        super(const QuizState());

  getQuizzes() async {
    emit(state.copyWith(getStatus: CubitStatus.loading));

    final result = await _getQuizzesUsecase(NoParams());

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
}
