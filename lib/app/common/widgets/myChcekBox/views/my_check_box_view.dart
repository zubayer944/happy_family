import 'package:flutter/material.dart';

class MyCheckBoxView extends StatelessWidget {
  final String? checkBoxTitle;
  final bool? isChecked;
  final Function(bool?)? onChanged;

  const MyCheckBoxView({
    Key? key,
     this.checkBoxTitle,
     this.isChecked,
     this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
        ),
        const SizedBox(width: 10,),
        Text(checkBoxTitle ?? "Check box"),
      ],
    );
  }
}
