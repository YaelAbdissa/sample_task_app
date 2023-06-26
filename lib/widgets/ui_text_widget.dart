import 'package:flutter/material.dart';

class UITextWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  const UITextWidget({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.fontFamily,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.clip,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );
  }
}
