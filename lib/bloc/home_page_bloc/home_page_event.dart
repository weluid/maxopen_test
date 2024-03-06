part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}

class GetPositionValuesEvent extends HomePageEvent{
  final Position? position;

  GetPositionValuesEvent({required this.position});
}
