import 'package:flutter/material.dart';

class GmcInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;
  final String placeholder;
  final Color color;
  final double fontSize;
  final bool password;
  final String Function(String) validator;
  final double padding;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final Map Function() onPress;
  final Map Function(String) onChange;
  final bool readOnly;
  final Widget prefixWidget;
  final Widget suffixWidget;
  final EdgeInsetsGeometry paddingBoder;
  final bool borderNone;

  const GmcInputField({Key key,
    this.controller,
    this.keyboardType,
    this.labelText,
    this.placeholder,
    this.color,
    this.fontSize = 22.0,
    this.password = false,
    this.validator = null,
    this.padding = 8.0,
    this.prefixIcon = null,
    this.suffixIcon = null,
    this.onPress,
    this.onChange,
    this.readOnly = false,
    this.prefixWidget = null,
    this.suffixWidget = null,
    this.paddingBoder = const EdgeInsets.symmetric(
        vertical: 18.0, horizontal: 5.0), this.borderNone = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.left,
      readOnly: readOnly,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        contentPadding: paddingBoder,
        border: !borderNone ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
              color: color,
            )) : InputBorder.none,
        focusedBorder:!borderNone ? OutlineInputBorder(
          borderSide: BorderSide(
            color: color,
          ),
        ) : null,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: fontSize - 2,
          color: color,
          height: 0.2,
          fontWeight: FontWeight.normal,
        ),
        hintText: placeholder,
        hintStyle: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.normal,
        ),
        filled: true,
        isDense: true,
        prefixIcon: prefixIcon != null
            ? Icon(
          prefixIcon,
          color: color,
          size: 24.0,
        )
            : (prefixWidget != null ? prefixWidget : null),
        suffixIcon: suffixIcon != null
            ? IconButton(
          onPressed: () => onPress(),
          icon: Icon(
            suffixIcon ?? null,
            color: color,
            size: 24.0,
          ),
        )
            : (suffixWidget != null ? suffixWidget : null),
      ),
      controller: controller,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      ),
      keyboardType: keyboardType,
      obscureText: password,
      autocorrect: false,
      validator: validator,
      onChanged: (String) => onChange(String),
    );
  }
}
