part of 'student_dashboard_bloc.dart';

abstract class StudentDashboardState extends Equatable {
  const StudentDashboardState();
    @override
  List<Object> get props => [];
  }

class StudentDashboardInitial extends StudentDashboardState {

}

class LoggingOut extends StudentDashboardState {

}

class LoggedOut extends StudentDashboardState {

}

class LogOutError extends StudentDashboardState {

}


