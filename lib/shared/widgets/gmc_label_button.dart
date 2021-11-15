import 'package:flutter/material.dart';
import 'package:gmc_app/shared/constants/colors.dart';

class GmcLabelButton extends StatelessWidget {
  final Color color;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final String label;
  final double widthBorder;
  final double heightBorder;
  final Function() onPress;

  const GmcLabelButton(
      {Key key,
      this.color = Colors.white,
      this.fontSize = 22.0,
      this.fontFamily = 'Gotham',
      this.fontWeight = FontWeight.normal,
      this.label,
      this.widthBorder = 25.0,
      this.heightBorder = 25.0,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        width: widthBorder,
        height: heightBorder,
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: ColorConstants.white,
          boxShadow: [
            BoxShadow(color: ColorConstants.Blue500, spreadRadius: 1),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
