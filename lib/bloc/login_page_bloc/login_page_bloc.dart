import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:maxopen_test/repository/local_storage.dart';
import 'package:maxopen_test/services/navigation_service.dart';
import 'package:maxopen_test/ui/home_page/home_page.dart';
import 'package:meta/meta.dart';

part 'login_page_event.dart';

part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc() : super(LoginPageInitial()) {
    on<CreateUserEvent>(_createUserEvent);
  }

  FutureOr<void> _createUserEvent(
    CreateUserEvent event,
    Emitter<LoginPageState> emit,
  ) async {
    emit(CreatingUserState(event.name));
    LocalStorage().setCurrentUser(event.name);
    // 1 sec pause to see the loader on the button
    await Future.delayed(const Duration(seconds: 1));
    NavigationService().push(const HomePage());
    emit(LoginPageInitial());
  }
}
