part of 'student_health_bloc.dart';

abstract class StudentHealthEvent extends Equatable {
  const StudentHealthEvent();

  @override
  List<Object> get props => [];
}

class FetchStudentHealth extends StudentHealthEvent {

  FetchStudentHealth();

  @override
  List<Object> get props => [];

}
