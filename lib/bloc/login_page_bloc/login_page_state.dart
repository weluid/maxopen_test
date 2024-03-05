part of 'login_page_bloc.dart';

@immutable
abstract class LoginPageState {}

class LoginPageInitial extends LoginPageState {}

class CreatingUserState extends LoginPageState {
  final String name;

  CreatingUserState(this.name);
}
