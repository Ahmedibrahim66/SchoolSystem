part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];

}

class InitialState extends AuthenticationState{}

class AuthenticatedStudent extends AuthenticationState {
  
}

class AuthenticatedParent extends AuthenticationState {
  
}

class AuthenticatedTeacher extends AuthenticationState {
  
}

class Unauthenticated extends AuthenticationState {
  
}

class Authenticating extends AuthenticationState {
  
}

// class AuthenticationError extends AuthenticationState {
  
// }


