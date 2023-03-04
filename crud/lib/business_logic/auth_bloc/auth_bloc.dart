import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:crud/data/data_repository/auth_repository.dart';
import 'package:crud/utils/secure_storage.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserAuth _userAuth = UserAuth();
  AuthBloc() : super(LoadingState()) {
    on<LoginCheckerEvent>(_loginChecker);
    on<LoginClickedEvent>(_loginClick);
    on<InitialEvent>(_initialEvent);
  }

  FutureOr<void> _initialEvent(
      InitialEvent initialEvent, Emitter<AuthState> emit) {
    emit.call(LoggedOutState());
  }

  FutureOr<void> _loginChecker(
      LoginCheckerEvent loginCheckerEvent, Emitter<AuthState> emit) async {
    emit.call(LoadingState());
    //checks if bearer token is saved or not
    bool userLoggedIn = await _userAuth.isLoggedIn();
    emit.call(userLoggedIn ? LoggedInState() : LoggedOutState());
  }

  FutureOr<void> _loginClick(
      LoginClickedEvent loginClickedEvent, Emitter<AuthState> emit) async {
    emit.call(LoadingState());
    try {
      var loginResponse = await AuthDataRepository()
          .requestLogin(loginClickedEvent.email, loginClickedEvent.password);
      if (loginResponse["success"] == "true") {
        _userAuth.saveAccessToken(loginResponse["access_token"]);
        emit.call(LoggedInState());
      } else {
        emit.call(ErrorState(message: loginResponse["msg"]));
      }
    } catch (e) {
      emit.call(ErrorState(message: "Server Down or no internet."));
    }
  }
}
