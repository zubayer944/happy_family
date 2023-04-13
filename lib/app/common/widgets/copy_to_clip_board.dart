import 'package:flutter/material.dart';

import '../utils/utils.dart';

class CopyToClipBoardIcon extends StatelessWidget {
  final String? value;
  const CopyToClipBoardIcon({Key? key,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: value!.isNotEmpty,
      child: GestureDetector(
        onTap: () => Utils.copyToClipBoard(value!),
        child: const Icon(
          Icons.copy_rounded,
          size: 14,
          color: Colors.grey,
        ),
      ),
    );
  }
}