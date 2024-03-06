part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class InitialStateWithPosition extends HomePageState {
  final Position? position;

  InitialStateWithPosition({required this.position});
}
