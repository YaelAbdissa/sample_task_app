import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UISvgIcon extends StatelessWidget {
  final String name;
  final BoxFit fit;
  final double? width;
  final double? height;
  const UISvgIcon({
    Key? key,
    required this.name,
    this.fit = BoxFit.fitHeight,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      name,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
