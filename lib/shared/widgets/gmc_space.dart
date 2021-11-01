import 'package:flutter/material.dart';

class GmcSpace extends StatelessWidget {
  final double width;
  final double height;

  const GmcSpace({Key key, this.width = 0, this.height = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return width > 0 ?  SizedBox( width: width) : SizedBox( height: height);
  }
}
