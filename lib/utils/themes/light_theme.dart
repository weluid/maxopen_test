import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maxopen_test/utils/themes/styles.dart';

class LightTheme {
  static final colors = AppColorLight();

  static final ThemeData themeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: colors.backgroundContent,
    primaryColor: colors.textPrimary,
    elevatedButtonTheme: _elevatedButtonTheme(),
    textTheme: _textTheme(),
    inputDecorationTheme: _inputDecorationTheme(),
    textButtonTheme: _textButtonTheme(),
  );

  static _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.backgroundPrimary,
        elevation: 0,
        disabledBackgroundColor: colors.buttonDisable,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: TextStyle(
          fontSize: 13,
          fontFamily: AppFont.sfProDisplayMedium,
          color: colors.textPrimary,
        ),
      ),
    );
  }


  static _textButtonTheme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        elevation: 0,
        foregroundColor: colors.backgroundPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 10,
          fontFamily: AppFont.sfProDisplayMedium,
        ),

      ),
    );
  }

  static _inputDecorationTheme() {
    return InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 11,
        fontFamily: AppFont.dewiRegular,
        color: colors.hintColor,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      suffixStyle: const TextStyle(
        fontSize: 16,
        fontFamily: AppFont.dewiRegular,
      ),
      prefixStyle: const TextStyle(
        fontSize: 16,
        fontFamily: AppFont.dewiRegular,
      ),
      outlineBorder: const BorderSide(
        color: Colors.transparent,
      ),
      activeIndicatorBorder: BorderSide(
        color: colors.backgroundPrimary,
      ),
      filled: true,
      fillColor: colors.darkGray,
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.purple,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: colors.darkGray,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: colors.backgroundPrimary,
        ),
      ),
    );
  }

  static _textTheme() {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 19,
        fontFamily: AppFont.dewiBold,
        color: colors.textPrimary,
      ),
      displayMedium: TextStyle(
        fontSize: 12,
        fontFamily: AppFont.dewiRegular,
        color: colors.textPrimary,
      ),
      displaySmall: TextStyle(
        fontSize: 10,
        fontFamily: AppFont.sfProDisplayMedium,
        color: colors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontFamily: AppFont.dewiBold,
        color: colors.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 13,
        fontFamily: AppFont.sfProDisplayMedium,
        color: colors.textPrimary,
      ),
      bodySmall: TextStyle(
        fontSize: 11,
        fontFamily: AppFont.dewiRegular,
        color: colors.textPrimary,
      ),
      headlineSmall: TextStyle(
        fontSize: 8,
        fontFamily: AppFont.dewiRegular,
        color: colors.textPrimary.withOpacity(0.6),
      ),
      headlineMedium: TextStyle(
        fontSize: 15,
        fontFamily: AppFont.dewiRegular,
        color: colors.textPrimary,
      ),
    );
  }
}
