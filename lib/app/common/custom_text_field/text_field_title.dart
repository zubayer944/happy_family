import 'package:flutter/cupertino.dart';

import '../values/style_text.dart';

class CustomTextFieldTitle extends StatelessWidget {
  final String title;

  const CustomTextFieldTitle(
      this.title, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: StyleText.nunitoSans_400_12,
    );
  }
}
