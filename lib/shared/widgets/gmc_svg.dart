import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GmcSVG extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final String icon;

  const GmcSVG({
    Key key,
    this.color = null,
    this.width = null,
    this.height = null,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      width: width,
      height: height,
      color: color,
    );
  }
}
