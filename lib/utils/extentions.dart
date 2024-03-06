import 'package:flutter/material.dart';
import 'package:maxopen_test/utils/themes/styles.dart';


extension BuildContextExtention on BuildContext {

  TextTheme get textTheme => Theme.of(this).textTheme;

  AppColor get colors => AppColorLight();
}