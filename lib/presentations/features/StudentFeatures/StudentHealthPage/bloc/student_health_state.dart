part of 'student_health_bloc.dart';

abstract class StudentHealthState extends Equatable {
  const StudentHealthState();
  
  @override
  List<Object> get props => [];
}

class StudentHealthEmpty extends StudentHealthState {}

class StudentHealthLoading extends StudentHealthState{}

class StudentHealthLoaded extends StudentHealthState {
  final List<StudentHealthEntity> list;

  const StudentHealthLoaded({@required this.list})
      : assert(list != null);

  @override
  List<Object> get props => [list];
}

class StudentHealthError extends StudentHealthState {}