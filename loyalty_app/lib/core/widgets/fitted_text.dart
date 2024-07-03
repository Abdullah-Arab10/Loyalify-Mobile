import 'package:flutter/material.dart';

class FittedText extends StatelessWidget {
  const FittedText({super.key, required this.text, required this.textStyle});

  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
