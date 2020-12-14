part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AuthenticationStarted extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class AuthenticationLoggedIn extends AuthenticationEvent {
  final String token;
  final String userId;
  final String userType;

  const AuthenticationLoggedIn(
      {@required this.token, @required this.userId, @required this.userType});

  @override
  List<Object> get props => [token, userId];

  @override
  String toString() =>
      'AuthenticationLoggedIn { token: $token, userId: $userId }';
}

class AuthenticationLoggedOut extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class AuthenticationChangeChildEvent extends AuthenticationEvent {
  final String userId;

  AuthenticationChangeChildEvent(this.userId);

  @override
  List<Object> get props => [];
}
