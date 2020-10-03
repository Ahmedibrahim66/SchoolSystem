part of 'student_info_bloc.dart';

@immutable
abstract class StudentInfoState extends Equatable {
  const StudentInfoState();
  @override
  List<Object> get props => [];
}

class StudentInfoEmpty extends StudentInfoState {}

class StudentInfoLoading extends StudentInfoState{}

class StudentInfoLoaded extends StudentInfoState {
  final StudentInfoEntity studentInfoEntity;

  const StudentInfoLoaded({@required this.studentInfoEntity})
      : assert(studentInfoEntity != null);

  @override
  List<Object> get props => [studentInfoEntity];
}

class StudentInfoError extends StudentInfoState {}
