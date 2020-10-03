part of 'student_attendence_bloc.dart';

abstract class StudentAttendenceState extends Equatable {
  const StudentAttendenceState();
   @override
  List<Object> get props => [];
}


class StudentAbsenceEmpty extends StudentAttendenceState {}

class StudentAbsenceLoading extends StudentAttendenceState{}

class StudentAbsenceLoaded extends StudentAttendenceState {
  final List<StudentAbsenceEntity> list;

  const StudentAbsenceLoaded({@required this.list})
      : assert(list != null);

  @override
  List<Object> get props => [list];
}

class StudentAbsenceError extends StudentAttendenceState {}
