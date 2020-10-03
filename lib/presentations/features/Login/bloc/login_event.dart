part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String userId;
  final String password;
  final String userType;

  const LoginButtonPressed({
    @required this.userId,
    @required this.password,
    @required this.userType,
  });

  @override
  List<Object> get props => [userId, password, userType];

  @override
  String toString() =>
      'LoginButtonPressed { username: $userId, password: $password, userType: $userType}';
}


