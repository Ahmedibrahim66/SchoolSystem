part of 'student_behaviour_bloc.dart';

abstract class StudentBehaviourEvent extends Equatable {
  const StudentBehaviourEvent();
}


class FetchStudentBehaviour extends StudentBehaviourEvent {

  FetchStudentBehaviour();

  @override
  List<Object> get props => [];

}

