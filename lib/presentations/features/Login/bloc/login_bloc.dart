import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mustafa0_1/Data/repositories/AuthenticationRepositoryImp.dart';
import 'package:mustafa0_1/presentations/features/Authentication/bloc/authentication_bloc.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepositoryImp authenticationRepositoryImp;
  final AuthenticationBloc authenticationBloc;

  LoginBloc(
      {@required this.authenticationRepositoryImp,
      @required this.authenticationBloc})
      : assert(authenticationRepositoryImp != null),
        assert(authenticationBloc != null),
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginInProgress();
      try {
        final token = await authenticationRepositoryImp.authenticate(
            event.userId, event.password, event.userType);
        if (token != null) {
          authenticationBloc
              .add(AuthenticationLoggedIn(token: token, userId: event.userId , userType: event.userType ));
          yield LoginInitial();
        } else
          yield LoginFailure(error: "wrong input");
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
