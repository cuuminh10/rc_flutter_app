import 'package:flutter/material.dart';
import 'package:gmc_app/shared/constants/colors.dart';

import 'gmc_svg.dart';

class GmcButtonSvg extends StatelessWidget {
  final Function onPressed;
  final String iconSvg;
  final Color colorBackground;
  final Color colorBorder;
  final double width;
  final double height;

  const GmcButtonSvg({
    Key key,
    this.onPressed,
    @required this.iconSvg,
    this.colorBackground = Colors.white,
    this.colorBorder,
    this.width = 36.0,
    this.height = 36.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: colorBackground,
            boxShadow: [
              BoxShadow(
                  color: colorBorder ?? ColorConstants.Gray6, spreadRadius: 1),
            ]),
        padding: EdgeInsets.all(8.0),
        child: GmcSVG(
          icon: iconSvg,
        ),
      ),
    );
  }
}
