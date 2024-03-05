import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maxopen_test/repository/local_storage.dart';
import 'package:maxopen_test/utils/app_blocs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Future.wait([
    LocalStorage().init(),

  ]);
  runAppWithBloc();
}