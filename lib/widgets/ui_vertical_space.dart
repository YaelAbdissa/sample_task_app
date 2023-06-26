import 'package:flutter/material.dart';

class UIVerticalSpace extends StatelessWidget {
  final double height;
  const UIVerticalSpace({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
