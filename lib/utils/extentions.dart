import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxopen_test/utils/themes/styles.dart';
import '../bloc/localization_bloc.dart';
import '../models/app_domain/localization.dart';

extension BuildContextExtention on BuildContext {
  Localization get locale => read<LocalizationCubit>().currentLocalization;

  TextTheme get textTheme => Theme.of(this).textTheme;

  AppColor get colors => AppColorLight();
}