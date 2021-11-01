import 'package:flutter/material.dart';

class GmcCard extends StatelessWidget {
  final double radius;
  final double vertical;
  final double horizontal;
  final Widget child;
  final Color color;
  final Gradient gradient;
  final Color background;
  final Offset offset;

  const GmcCard({
    Key key,
    this.radius = 10.0,
    this.vertical = 10.0,
    this.horizontal = 20.0,
    this.child,
    this.color = Colors.transparent,
    this.gradient,
    this.background = Colors.transparent,
    this.offset = const Offset(0.0, 0.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        color: color,
        margin:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: Container(
          decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: background,
                  offset: offset,
                  blurRadius: 1.5,
                ),
              ]),
          child: child,
        ));
  }
}
