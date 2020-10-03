import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mustafa0_1/Data/repositories/AuthenticationRepositoryImp.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepositoryImp repository;

  AuthenticationBloc({this.repository})
      : assert(repository != null),
        super(InitialState());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStarted) {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString('userType') == "S")
        yield AuthenticatedStudent();
      else if(prefs.getString('userType') == "P")
      yield AuthenticatedParent();
      else
        yield Unauthenticated();
        
    } else if (event is AuthenticationLoggedIn) {

      yield Authenticating();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      
      prefs.setString('userType', event.userType);

      if(event.userType == "S"){
      prefs.setString('userToken', event.token);
      prefs.setString('userId', event.userId);
      yield AuthenticatedStudent();
      } else if(event.userType == "P"){
      prefs.setString('userToken', event.token);
      prefs.setString('ParentId', event.userId);
      yield AuthenticatedParent();

      }


    } else if (event is AuthenticationLoggedOut) {

      yield Authenticating();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userToken', null);
      prefs.setString('userId', null);
      prefs.setString('userType', null);
      prefs.setString('ParentId', null);

      yield Unauthenticated();

    }
  }
}
