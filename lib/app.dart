import 'package:flutter/material.dart';

import 'package:maxopen_test/ui/login_page/login_page.dart';
import 'package:maxopen_test/utils/themes/light_theme.dart';

class App extends StatefulWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  const App({super.key});

  static BuildContext get globalContext => navigatorKey.currentState!.context;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: App.scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: 'app',
      navigatorKey: App.navigatorKey,
      theme: LightTheme.themeData,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: child!,
        );
      },
      home: const LoginPage(),
    );
  }
}
