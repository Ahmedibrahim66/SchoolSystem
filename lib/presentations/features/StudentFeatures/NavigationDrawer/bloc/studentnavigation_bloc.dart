import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/presentations/features/Authentication/bloc/authentication_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'studentnavigation_event.dart';
part 'studentnavigation_state.dart';

class StudentnavigationBloc
    extends Bloc<StudentnavigationEvent, StudentnavigationState> {
  StudentnavigationBloc() : super(StudentnavigationInitial(0));

  @override
  Stream<StudentnavigationState> mapEventToState(
    StudentnavigationEvent event,
  ) async* {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (event is LogoutEvent) {
      Navigator.pop(event.context);
      BlocProvider.of<AuthenticationBloc>(event.context)
          .add(AuthenticationLoggedOut());
    }

    if (event is NavigateToHomeScreen) {
      // Navigator.pop(event.context);
      if (preferences.getString('ParentId') != null)
        yield StudentnavigationToHome(1);
      else
        yield StudentnavigationToHome(0);
    }

    if (event is NavigateToStudentProfile) {
      Navigator.pop(event.context);
      if (preferences.getString('ParentId') != null)
        yield StudentProfileState(1);
      else
        yield StudentProfileState(0);
    }

    if (event is NavigateToStudentGrades) {
      Navigator.pop(event.context);
      if (preferences.getString('ParentId') != null)
        yield StudentMarksState(1);
      else
        yield StudentMarksState(0);
    }
    if (event is NavigateToStudentPayment) {
      Navigator.pop(event.context);
      if (preferences.getString('ParentId') != null)
        yield StudentsPaymentState(1);
      else
        yield StudentsPaymentState(0);
    }
    if (event is NavigateToStudentLeaningMaterial) {
      Navigator.pop(event.context);
      if (preferences.getString('ParentId') != null)
        yield StudentsLearningMaterialState(1);
      else
        yield StudentsLearningMaterialState(0);
    }
    if (event is NavigateToStudentHomeWorkMaterial) {
      Navigator.pop(event.context);
      if (preferences.getString('ParentId') != null)
        yield StudentsHomeWorkMaterialState(1);
      else
        yield StudentsHomeWorkMaterialState(0);
    }
    if (event is NavigateToStudentDiscussion) {
      yield StudentsDiscussionState(0);
    }
    if (event is NavigateToStudentExams) {
      yield StudentsExamState(0);
    }

    if (event is NavigateToStudentMessages) {
      yield StudentsMessagesState(0);
    }
  }
}
