import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxopen_test/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:maxopen_test/bloc/login_page_bloc/login_page_bloc.dart';
import '../app.dart';
import '../bloc/localization_bloc.dart';

void runAppWithBloc() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocalizationCubit()),
        BlocProvider(create: (_) => LoginPageBloc()),
        BlocProvider(create: (_) => HomePageBloc()),

      ],
      child: const App(),
    ),
  );
}
