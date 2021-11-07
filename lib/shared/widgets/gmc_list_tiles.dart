import 'package:flutter/material.dart';
import 'package:gmc_app/shared/constants/colors.dart';

import 'gmc_label.dart';
import 'gmc_svg.dart';


class GmcListTiles extends StatelessWidget {
  final Color color;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final String label;
  final List<dynamic> list;
  final String iconSvg;
  final double radius;
  final Color colorBorder;
  final Color colorIcon;
  final double width;
  final double height;

  const GmcListTiles(
      {Key key,
      this.color = Colors.white,
      this.fontSize = 22.0,
      this.fontFamily = 'Mulish',
      this.fontWeight = FontWeight.w600,
      this.label,
      this.list,
      this.iconSvg,
      this.radius = 8.0,
      this.colorBorder,
      this.colorIcon,
      this.width = 40.0,
      this.height = 40.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: list.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return ListTile(
          leading: GestureDetector(
            onTap: () => {},
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: colorBorder ?? ColorConstants.lightYellow),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GmcSVG(
                  icon: iconSvg,
                  color: colorIcon ?? Colors.white,
                ),
              ),
            ),
          ),
          title: GmcLabel(
            color: ColorConstants.darkHeading,
            fontSize: 16.0,
            fontFamily: 'Mulish',
            label: list[index].expandedValue
          ),
          subtitle: GmcLabel(
            color: ColorConstants.content,
            fontSize: 10.0,
            fontFamily: 'Mulish',
            label: list[index].subTittleValue,
            fontWeight: FontWeight.normal,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(color: ColorConstants.Gray6, thickness: 1.0);
      },
    );
  }
}
