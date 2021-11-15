import 'package:flutter/cupertino.dart';
import 'package:gmc_app/shared/constants/colors.dart';

class GmcCupertinoBottom extends StatelessWidget {
  final String lable;
  final Function onPressed;

  const GmcCupertinoBottom({
    Key key,
    this.onPressed,
    this.lable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheetAction(
        child: Text(
          lable,
          style: TextStyle(color: ColorConstants.black),
        ),
        onPressed: () {
          if (onPressed != null) {
            onPressed();
          }
          Navigator.of(context, rootNavigator: true).pop(lable);
        });
  }
}