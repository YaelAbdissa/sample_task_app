import 'package:flutter/material.dart';

import '../configs/constants.dart';

class UITextFieldWidget extends StatelessWidget {
  final String text;
  final FocusNode focusNode;
  final bool haveMaxLines;

  const UITextFieldWidget({
    super.key,
    required this.text,
    this.haveMaxLines = false,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 20,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
        // border: Border.all(
        //   width: 0.5,
        //   color: borderColor,
        // ),
      ),
      child: TextField(
        focusNode: focusNode,
        maxLines: haveMaxLines ? 8 : 1,
        decoration: InputDecoration(
            hintText: text,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0.5,
                color: borderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintStyle: TextStyle(
              color: textColor4,
              fontFamily: fontNamePoppins,
              fontSize: 16,
            )),
        onChanged: (value) {},
      ),
    );
  }
}
