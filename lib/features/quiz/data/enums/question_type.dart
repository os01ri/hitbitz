enum QuestionType {
  none,
  trueFalse,
  multipleSelect,
  matching,
  gapFilling,
  sorting;

  static QuestionType getByIndex(int? index) => switch (index) {
        1 => trueFalse,
        2 => multipleSelect,
        3 => matching,
        4 => gapFilling,
        5 => sorting,
        _ => none,
      };
}
