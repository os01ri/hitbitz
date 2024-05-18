part of 'main_cubit.dart';

class MainState {
  final CubitStatus suggestionStatus;

  const MainState({
    this.suggestionStatus = CubitStatus.initial,
  });

  MainState copyWith({
    CubitStatus? suggestionStatus,
  }) {
    return MainState(
      suggestionStatus: suggestionStatus ?? this.suggestionStatus,
    );
  }
}
