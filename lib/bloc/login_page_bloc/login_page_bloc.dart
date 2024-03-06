import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
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
    Position? position = await _determinePosition();

    // 1 sec pause to see the loader on the button
    await Future.delayed(const Duration(seconds: 1));
    NavigationService().push(
      HomePage(position: position),
    );

    emit(LoginPageInitial());
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position?> _determinePosition() async {
    LocationPermission permission;

    // Test if location services are enabled.
    await Geolocator.isLocationServiceEnabled();

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      // if (permission == LocationPermission.always ) {
      return await Geolocator.getCurrentPosition();
    } else {
      return null;
    }
  }
}
