import 'package:flutter/material.dart';

class ColorConstants {
  static Color lightScaffoldBackgroundColor = hexToColor('#F9F9F9');
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = hexToColor('#22DDA6');
  static Color secondaryDarkAppColor = Colors.white;
  static Color tipColor = hexToColor('#B6B6B6');
  static Color lightGray = Color(0xFFF6F6F6);
  static Color darkGray = Color(0xFF9F9F9F);
  static Color black = Color(0xFF000000);
  static Color white = Color(0xFFFFFFFF);
  static Color darkHeading = hexToColor('#002158');
  static Color gray4 = hexToColor('#6B7280');
  static Color secondary3 = hexToColor('#4267CE');
  static Color gray1 = hexToColor('#1F2937');
  static Color gray3 = hexToColor('#4B5563');
  static Color floatbutton0 = hexToColor('#FC081C');
  static Color floatbutton100 = hexToColor('#FAB218');
  static Color floatDisable0 = hexToColor('#FF6875');
  static Color floatDisable100 = hexToColor('#FFE3A7');
  static Color borderDashBoard = hexToColor('#FAB218');
  static Color Gray4 = hexToColor('#6B7280');
  static Color content = hexToColor('#4E5983');
  static Color gray7 = hexToColor('#F3F4F6');
  static Color gray6 = hexToColor('#DEE2E8');
  static Color lightYellow = hexToColor('#FFEECA');
  static Color background = hexToColor('#07245B');

}

Gradient gradient(bool disable) {
  return LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment(0.4, 0.0),
    colors: <Color>[
      disable ? ColorConstants.floatbutton100 : ColorConstants.floatDisable100,
      disable ? ColorConstants.floatbutton0 : ColorConstants.floatDisable0
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
