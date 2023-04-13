import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happy_family/app/common/values/my_colors.dart';

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
  static get unFocus => FocusManager.instance.primaryFocus?.unfocus();

  static void copyToClipBoard(String text) {
    if (text.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: text));
      // Get.showToast("Copied", isLongLength: false);
      Fluttertoast.showToast(
        msg: "Copied",
        toastLength: true ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: MyColors.greenColor,
        textColor: MyColors.whiteColor,
        fontSize: 16.0,
      );
    }
  }
}