import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmc_app/shared/constants/colors.dart';

class GmcRaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const GmcRaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: 50.0,
        decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: ColorConstants.Blue800,
                offset: Offset(0.0, 1.5),
                blurRadius: 1.5,
              ),
            ]),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
