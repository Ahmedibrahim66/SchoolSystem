part of 'studentprofilenavigation_bloc.dart';

abstract class StudentprofilenavigationEvent extends Equatable {
  const StudentprofilenavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigateToStudentProfileID extends StudentprofilenavigationEvent {}
class NavigateToStudentAbsence extends StudentprofilenavigationEvent {}
class NavigateToStudentBehavior extends StudentprofilenavigationEvent {}
class NavigateToStudentLate extends StudentprofilenavigationEvent {}
class NavigateToStudentHealth extends StudentprofilenavigationEvent {}



