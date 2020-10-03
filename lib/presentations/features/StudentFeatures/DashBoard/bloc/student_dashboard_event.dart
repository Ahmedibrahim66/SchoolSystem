part of 'student_dashboard_bloc.dart';

abstract class StudentDashboardEvent extends Equatable {
  const StudentDashboardEvent();
}

class LogOutButtonPressed extends StudentDashboardEvent {
  LogOutButtonPressed();

    @override
  List<Object> get props => [];

}
