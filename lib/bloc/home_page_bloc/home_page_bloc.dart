import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<GetPositionValuesEvent>(_positionValueEvent);
  }

  FutureOr<void> _positionValueEvent(
    GetPositionValuesEvent event,
    Emitter<HomePageState> emit,
  ) {
    emit(
      InitialStateWithPosition(
        position: event.position,
      ),
    );
  }
}
