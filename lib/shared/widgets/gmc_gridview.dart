import 'package:flutter/material.dart';

class GmcGridView extends StatelessWidget {
  final double height;
  final Widget child;
  final int crossAxisCount;
  final int childAspectRatioX;
  final int childAspectRatioY;
  final List<Widget> listWidget;

  const GmcGridView({
    Key key,
    this.height = double.infinity,
    this.child,
    this.crossAxisCount,
    this.childAspectRatioX,
    this.childAspectRatioY,
    this.listWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: GridView.count(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatioX / childAspectRatioY,
          children: listWidget),
    );
  }
}
