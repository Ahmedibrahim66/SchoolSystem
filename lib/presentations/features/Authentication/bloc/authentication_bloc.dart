import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mustafa0_1/Data/repositories/AuthenticationRepositoryImp.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';


/*
 * this class is used to authenticate the users either after having
 * logged in with correct credientials or after coming back to the 
 * app while not logging out. it also have the functions to change 
 * the parent choosen child
 */

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
      /**
       * start of authentication check sharedPrefences 
       * userType -> S for student || P for parent
       */
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (prefs.getString('userType') == "S")
        yield AuthenticatedStudent();
      else if (prefs.getString('userType') == "P")
        yield AuthenticatedParent();
      else
        yield Unauthenticated();

    } else if (event is AuthenticationLoggedIn) {

      /**
       * User Credintials are succesfull authenticate the user and 
       * save his data in shared prefrences for future use
       */

      yield Authenticating();

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('userType', event.userType);

      if (event.userType == "S") {

        prefs.setString('userToken', event.token);
        prefs.setString('userId', event.userId);

        yield AuthenticatedStudent();

      } else if (event.userType == "P") {

        prefs.setString('userToken', event.token);
        prefs.setString('ParentId', event.userId);

        yield AuthenticatedParent();

      }
    } else if (event is AuthenticationLoggedOut) {

       /**
       * User Credintials pressed the loggout button
       * delete use data from shared prefrences
       */
      yield Authenticating();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userToken', null);
      prefs.setString('userId', null);
      prefs.setString('userType', null);
      prefs.setString('ParentId', null);

      yield Unauthenticated();

    } else if (event is AuthenticationChangeChildEvent) {

       /**
       * parent choose diffrenet child reload the authentication 
       * and navigate back to the newly choosen child home page
       */

      yield Authenticating();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('userId', null);
      await preferences.setString('userId', event.userId);
      yield AuthenticatedParent();

    }
  }
}
