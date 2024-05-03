enum QuestionType {
  none,
  trueFalse,
  multipleSelect,
  matching,
  gapFilling,
  verticalSorting,
  horizontalSorting;

  static QuestionType getByIndex(int? index) => switch (index) {
        1 => trueFalse,
        2 => multipleSelect,
        3 => matching,
        4 => gapFilling,
        5 => verticalSorting,
        6 => horizontalSorting,
        _ => none,
      };
}
