import 'package:flutter/material.dart';
import 'package:gmc_app/shared/constants/colors.dart';

import 'gmc_label.dart';
import 'gmc_svg.dart';

class GmcTiles extends StatelessWidget {
  final Color color;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final String label;
  final dynamic item;
  final String iconSvg;
  final double radius;
  final Color colorBorder;
  final Color colorIcon;
  final double width;
  final double height;
  final String labelExpandedValue;
  final String labelSubTittleValue;
  final bool borderLeading;
  final double paddingIcon;
  final Widget widgetLeading;
  final Color colorLeading;
  final String labelLeading;
  final TextStyle styleLeading;
  final void Function()  callBack;

  const GmcTiles(
      {Key key,
        this.color = Colors.white,
        this.fontSize = 22.0,
        this.fontFamily = 'Mulish',
        this.fontWeight = FontWeight.w600,
        this.label,
        this.item,
        this.iconSvg,
        this.radius = 8.0,
        this.colorBorder = Colors.white,
        this.colorIcon = Colors.white,
        this.width = 40.0,
        this.height = 40.0,
        this.labelExpandedValue,
        this.labelSubTittleValue,
        this.borderLeading = true,
        this.paddingIcon = 8.0,
        this.widgetLeading,
        this.colorLeading,
        this.labelLeading,
        this.styleLeading, this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: GestureDetector(
        onTap: () => {
          callBack()
        },
        child: widgetLeading == null
            ? Container(
          width: width,
          height: height,
          decoration: radius > 0
              ? BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: colorBorder ?? ColorConstants.lightYellow)
              : null,
          child: Padding(
            padding: EdgeInsets.all(paddingIcon),
            child: Container(
              // decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.yellow, Colors.black])),
              child: GmcSVG(
                icon: iconSvg,
                color: colorIcon,
              ),
            ),
          ),
        )
            : CircleAvatar(
            backgroundColor: colorLeading ?? ColorConstants.fuchisa,
            child: widgetLeading),
      ),
      title: GmcLabel(
          color: ColorConstants.darkHeading,
          fontSize: 12.0,
          fontFamily: 'Mulish',
          label: labelExpandedValue ?? item.expandedValue),
      subtitle: GmcLabel(
        color: ColorConstants.content,
        fontSize: 18.0,
        fontFamily: 'Mulish',
        label: labelSubTittleValue ?? item.subTittleValue,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
