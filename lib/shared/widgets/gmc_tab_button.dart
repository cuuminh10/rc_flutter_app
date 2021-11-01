import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gmc_app/shared/constants/colors.dart';

class GmcTabButton extends StatelessWidget {
  final String text;
  final int selectedPage;
  final int pageNumber;
  final Set<void> Function() onPressed;
  final bool boxDecoration;
  final double paddingBoxDecoration;
  final Color colorBoxDecoration;
  final double radiusBoxDecoraion;
  final double fontSize;
  final double fontSizeBox;
  final Alignment alignment;
  final double padding;
  final double margin;

  const GmcTabButton(
      {Key key,
        this.text,
        this.selectedPage = 0,
        this.pageNumber = 0,
        this.onPressed,
        this.boxDecoration = false,
        this.paddingBoxDecoration = 10.0,
        this.colorBoxDecoration,
        this.radiusBoxDecoraion = 4.0,
        this.fontSize = 20.0,
        this.alignment = Alignment.topLeft,
        this.fontSizeBox = 15.0,
        this.padding = 10.0,
        this.margin = 10.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size.width * 0.3,
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          padding: EdgeInsets.symmetric(
            vertical: selectedPage == pageNumber
                ? !boxDecoration
                ? 0.0
                : 0.0
                : 0,
            horizontal: selectedPage == pageNumber
                ? !boxDecoration
                ? padding
                : 5.0
                : 0,
          ),
          margin: !boxDecoration
              ? EdgeInsets.symmetric(
            vertical: selectedPage == pageNumber ? 0 : 10.0,
            horizontal: selectedPage == pageNumber ? 0 : margin,
          )
              : null,
          child: Container(
            child: Column(
              children: [
                boxDecoration
                    ? Container(
                  padding: EdgeInsets.all(paddingBoxDecoration),
                  decoration: selectedPage == pageNumber
                      ? BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(radiusBoxDecoraion),
                      color: colorBoxDecoration ?? ColorConstants.Blue500)
                      : null,
                  child: Align(
                    alignment: alignment,
                    child: Text(
                      text,
                      style: TextStyle(
                          color:selectedPage == pageNumber ? ColorConstants.white : ColorConstants.Blue500,
                          fontFamily: 'Gotham',
                          fontSize: fontSizeBox),
                    ),
                  ),
                )
                    : Align(
                  alignment: alignment,
                  child: Text(
                    text,
                    style: TextStyle(
                      color: ColorConstants.Blue500,
                      fontFamily: 'Gotham',
                      fontSize: fontSize,
                    ),
                  ),
                ),
                if (selectedPage == pageNumber && !boxDecoration)
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(right: size.width * 0.2),
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 2, color: ColorConstants.darkHeading),
                        )),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
