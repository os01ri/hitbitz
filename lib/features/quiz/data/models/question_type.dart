enum QuestionType {
  none,
  trueFalse,
  multiSelect,
  match,
  fillGap,
  sort;

  static QuestionType getByIndex(int? index) => switch (index) {
        1 => trueFalse,
        2 => multiSelect,
        3 => match,
        4 => fillGap,
        5 => sort,
        _ => none,
      };
}
