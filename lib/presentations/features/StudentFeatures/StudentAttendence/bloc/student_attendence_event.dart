part of 'student_attendence_bloc.dart';

abstract class StudentAttendenceEvent extends Equatable {
  const StudentAttendenceEvent();
}

class FetchStudentAbsence extends StudentAttendenceEvent {

  FetchStudentAbsence();

  @override
  List<Object> get props => [];

}
