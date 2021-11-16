import 'package:flutter/material.dart';

class ColorConstants {
  static Color Blue800 = hexToColor('#07245B');
  static Color Blue500 = hexToColor('#4A77BE');
  static Color Blue100 = hexToColor('#E1EDF9');
  static Color Gray6 = hexToColor('#D1D5DB');
  static Color Gray3 = hexToColor('#4B5563');
  static Color Orange600 = hexToColor('#F7941D');


  static Color content = hexToColor('#4E5983');
  static Color lightYellow = hexToColor('#FFEECA');
  static Color lightGray = Color(0xFFF6F6F6);
  static Color lightScaffoldBackgroundColor = hexToColor('#F9F9F9');
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = hexToColor('#22DDA6');
  static Color secondaryDarkAppColor = Colors.white;
  static Color tipColor = hexToColor('#B6B6B6');
  static Color darkGray = Color(0xFF9F9F9F);
  static Color black = Color(0xFF000000);
  static Color white = Color(0xFFFFFFFF);
  static Color darkHeading = hexToColor('#002158');
  static Color fuchisa = hexToColor('#F178B6');
  static Color warning = hexToColor('#FBC756');

}

Gradient gradient(bool disable) {
  return LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment(0.4, 0.0),
    colors: <Color>[
      disable ? ColorConstants.Blue800 : ColorConstants.Blue800,
      disable ? ColorConstants.Blue800 : ColorConstants.Blue800
    ],
  );
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
