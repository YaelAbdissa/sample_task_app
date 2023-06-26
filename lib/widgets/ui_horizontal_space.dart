import 'package:flutter/material.dart';

class UIHorizontalSpace extends StatelessWidget {
  final double width;
  const UIHorizontalSpace({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
