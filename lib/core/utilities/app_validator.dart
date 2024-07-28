class AppValidator {
  const AppValidator._();

  static String? required(String? value) {
    if ((value ?? '').isEmpty) return 'This field is required';
    return null;
  }

  static String? name(String? value) {
    if ((value ?? '').isEmpty) return 'This field is required';
    if (value!.length < 2) return 'invalid name';
    final hasMatches = RegExp(r'^[A-Za-z\u0600-\u06FF]+$').hasMatch(value);
    if (!hasMatches) return 'invalid name';
    return null;
  }

  static String? password(String? value) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$');
    if ((value ?? '').isEmpty || !passwordRegex.hasMatch(value!)) return '8 or more chars, mixed digits & letters';
    return null;
  }

  static String? email(String? value) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if ((value ?? '').isEmpty || !emailRegex.hasMatch(value!)) return 'Not valid E-mail';
    return null;
  }
}
