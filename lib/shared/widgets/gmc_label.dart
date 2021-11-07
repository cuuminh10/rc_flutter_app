import 'package:flutter/material.dart';

class GmcLabel extends StatelessWidget {
  final Color color;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final String label;

  const GmcLabel({Key key, this.color = Colors.white, this.fontSize = 22.0, this.fontFamily = 'Gotham', this.fontWeight = FontWeight.normal, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(label, style: TextStyle(
          color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),),
    );
  }
}
