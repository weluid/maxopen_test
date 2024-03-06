import 'package:flutter/material.dart';

class AppFont {
  static const String dewiSemibold = 'dewiSemibold';
  static const String dewiBold = 'dewiBold';
  static const String dewiRegular = 'dewiRegular';
  static const String sfProDisplayMedium = 'sfProDisplayMedium';
}

abstract class AppColor {
  final Color backgroundPrimary;
  final Color backgroundContent;
  final Color textPrimary;
  final Color buttonDisable;
  final Color hintColor;
  final Color darkGray;
  final Color lightGray;

  const AppColor({
    required this.backgroundPrimary,
    required this.backgroundContent,
    required this.textPrimary,
    required this.buttonDisable,
    required this.hintColor,
    required this.darkGray,
    required this.lightGray,
  });
}

class AppColorLight implements AppColor {
  @override
  Color get backgroundContent => const Color.fromRGBO(30, 30, 30, 1);

  @override
  Color get backgroundPrimary => const Color.fromRGBO(12, 186, 112, 1);

  @override
  Color get textPrimary => Colors.white;

  @override
  Color get buttonDisable => const Color.fromRGBO(56, 56, 56, 1);

  @override
  Color get hintColor => Colors.white.withOpacity(0.6);

  @override
  Color get darkGray => const Color.fromRGBO(41, 41, 41, 1);

  @override
  Color get lightGray => const Color.fromRGBO(110, 110, 110, 1);
}

class AppColorDark implements AppColor {
  @override
  Color get backgroundContent => Colors.white;

  @override
  Color get backgroundPrimary => const Color.fromRGBO(227, 232, 235, 1);

  @override
  Color get textPrimary => Colors.black;

  @override
  Color get buttonDisable => const Color.fromRGBO(56, 56, 56, 1);

  @override
  Color get hintColor => Colors.white.withOpacity(0.6);

  @override
  Color get darkGray => const Color.fromRGBO(41, 41, 41, 1);

  @override
  Color get lightGray => const Color.fromRGBO(110, 110, 110, 1);
}
