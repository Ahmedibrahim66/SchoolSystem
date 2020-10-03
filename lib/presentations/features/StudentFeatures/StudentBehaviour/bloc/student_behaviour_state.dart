part of 'student_behaviour_bloc.dart';

abstract class StudentBehaviourState extends Equatable {
  const StudentBehaviourState();
   @override
  List<Object> get props => [];

}


class StudentBehaviourEmpty extends StudentBehaviourState {}

class StudentBehaviourLoading extends StudentBehaviourState{}

class StudentBehaviourLoaded extends StudentBehaviourState {
  final List<StudentBehaviourEntity> studentBehaviourEntity;

  const StudentBehaviourLoaded({@required this.studentBehaviourEntity})
      : assert(studentBehaviourEntity != null);

  @override
  List<Object> get props => [studentBehaviourEntity];
}

class StudentBehaviourError extends StudentBehaviourState {}

