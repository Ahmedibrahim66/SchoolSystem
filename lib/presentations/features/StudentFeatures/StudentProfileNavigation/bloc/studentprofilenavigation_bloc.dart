import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'studentprofilenavigation_event.dart';
part 'studentprofilenavigation_state.dart';

class StudentprofilenavigationBloc
    extends Bloc<StudentprofilenavigationEvent, StudentprofilenavigationState> {
  StudentprofilenavigationBloc() : super(StudentProfileIDState());

  @override
  Stream<StudentprofilenavigationState> mapEventToState(
    StudentprofilenavigationEvent event,
  ) async* {
    if (event is NavigateToStudentProfileID) {
      yield StudentProfileIDState();
    }
    if (event is NavigateToStudentAbsence) {
      yield StudentProfileAbsenceState();
    }
    if (event is NavigateToStudentBehavior) {
      yield StudentProfileBehavoirState();
    }
    if (event is NavigateToStudentLate) {
      yield StudentProfileLateState();
    }
    if (event is NavigateToStudentHealth) {
      yield StudentProfileHealthState();
    }

  }
}
