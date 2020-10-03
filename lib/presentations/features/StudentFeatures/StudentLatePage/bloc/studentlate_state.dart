part of 'studentlate_bloc.dart';

abstract class StudentlateState extends Equatable {
  const StudentlateState();
  
  @override
  List<Object> get props => [];
}

class StudentLateEmpty extends StudentlateState {}

class StudentLateLoading extends StudentlateState{}

class StudentLateLoaded extends StudentlateState {
  final List<StudentLateEntity> list;

  const StudentLateLoaded({@required this.list})
      : assert(list != null);

  @override
  List<Object> get props => [list];
}

class StudentLateError extends StudentlateState {}
