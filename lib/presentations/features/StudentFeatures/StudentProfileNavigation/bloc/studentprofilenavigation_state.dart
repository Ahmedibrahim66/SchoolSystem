part of 'studentprofilenavigation_bloc.dart';

abstract class StudentprofilenavigationState extends Equatable {
  const StudentprofilenavigationState();
  
  @override
  List<Object> get props => [];
}

class StudentprofilenavigationInitial extends StudentprofilenavigationState {}
class StudentProfileIDState extends StudentprofilenavigationInitial {}
class StudentProfileAbsenceState extends StudentprofilenavigationInitial {}
class StudentProfileBehavoirState extends StudentprofilenavigationInitial {}
class StudentProfileLateState extends StudentprofilenavigationInitial {}
class StudentProfileHealthState extends StudentprofilenavigationInitial {}
