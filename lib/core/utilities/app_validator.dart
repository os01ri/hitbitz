class AppValidator {
  const AppValidator._();

  static String? required(String? value) {
    if ((value ?? "").isEmpty) return "هذا الحقل مطلوب";
    return null;
  }
}
