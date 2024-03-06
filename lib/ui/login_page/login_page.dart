import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxopen_test/bloc/login_page_bloc/login_page_bloc.dart';
import 'package:maxopen_test/ui/login_page/login_page_view.dart';

/// Login page with bloc builder logic
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginPageBloc, LoginPageState>(
      builder: (context, state) {
        if (state is LoginPageInitial) {
          return const LoginPageView();
        } else if (state is CreatingUserState) {
          return  LoginPageView(
            loadingState: true,
            name: state.name,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
