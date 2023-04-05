import '../values/all_strings.dart';

class Utils {
  static String? passwordValidator(String? password) {
    password ??= "";
    return password.isEmpty
        ? AllStrings.passwordIsRequired
        : !password.contains(RegExp(r"[a-z]")) && !password.contains(RegExp(r"[A-Z]"))
        ? AllStrings.atLeast1CharNeeded
        : !password.contains(RegExp("[0-9]"))
        ? AllStrings.atLeast1DigitNeeded
        : password.length < 8
        ? AllStrings.minimum8Char
        : null;
  }

  static emptyValidator(String? value, String msg) {
    return (value ?? "").trim().isEmpty ? msg : null;
  }
}