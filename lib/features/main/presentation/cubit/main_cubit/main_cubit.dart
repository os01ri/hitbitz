import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/features/main/domain/usecases/make_suggestion_usecase.dart';
import 'package:injectable/injectable.dart';

part 'main_state.dart';

@lazySingleton
class MainCubit extends Cubit<MainState> {
  final MakeSuggestionUsecase _makeSuggestionUsecase;

  MainCubit({
    required MakeSuggestionUsecase makeSuggestionUsecase,
  })  : _makeSuggestionUsecase = makeSuggestionUsecase,
        super(const MainState());

  makeSuggestion(SuggestionParams params) async {
    emit(state.copyWith(suggestionStatus: CubitStatus.loading));

    final result = await _makeSuggestionUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(suggestionStatus: CubitStatus.failure)),
      (r) => emit(state.copyWith(suggestionStatus: CubitStatus.success)),
    );
  }
}
