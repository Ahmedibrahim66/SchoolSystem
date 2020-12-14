part of 'studentexams_bloc.dart';

abstract class StudentexamsState extends Equatable {
  const StudentexamsState();
  
  @override
  List<Object> get props => [];
}

class StudentExamsInitial extends StudentexamsState {}

class StudentExamsLoading extends StudentexamsState{}

class StudentExamsLoaded extends StudentexamsState {
  final List<StudentExamModel> list;

  const StudentExamsLoaded({@required this.list})
      : assert(list != null);

  @override
  List<Object> get props => [list];
}

class StudentExamsError extends StudentexamsState {}