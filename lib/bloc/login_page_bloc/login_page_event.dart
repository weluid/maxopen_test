part of 'login_page_bloc.dart';

@immutable
abstract class LoginPageEvent {}

class CreateUserEvent extends LoginPageEvent {
  final String name;

  CreateUserEvent(this.name);
}
