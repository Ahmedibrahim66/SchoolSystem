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
      {
        print(preferences.getString('ParentId'));
        yield StudentProfileState(1);

      }
      else
      yield StudentProfileState(0);
    }

    if (event is NavigateToStudentGrades) {
      Navigator.pop(event.context);
      yield StudentMarksState(0);
    }

    if (event is NavigateToStudentPayment) {
      Navigator.pop(event.context);
      yield StudentsPaymentState(0);
    }
    if (event is NavigateToStudentLeaningMaterial) {
      Navigator.pop(event.context);
      yield StudentsLearningMaterialState(0);
    }


    //////////////// parent child choose
    
   
  }
}
