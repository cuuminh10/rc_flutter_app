import 'package:flutter/material.dart';

class GmcSpace extends StatelessWidget {
  final double width;
  final double height;
  final Color border;
  final double widthBorder;

  const GmcSpace(
      {Key key, this.width = 0, this.height = 0, this.border, this.widthBorder = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return border == null ? width > 0 ? SizedBox(width: width) : SizedBox(
        height: height) : Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: widthBorder, color: border),
          )
      ),
      child: width > 0 ? SizedBox(width: width) : SizedBox(
          height: height) ,
    )
    ;
  }
}
