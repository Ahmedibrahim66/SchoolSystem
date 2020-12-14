import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentExamModel.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'studentexams_event.dart';
part 'studentexams_state.dart';

class StudentexamsBloc extends Bloc<StudentexamsEvent, StudentexamsState> {
  final StudentRepository repository;

  StudentexamsBloc(this.repository) : super(StudentExamsInitial());

  @override
  Stream<StudentexamsState> mapEventToState(
    StudentexamsEvent event,
  ) async* {
    if (event is FetchStudentExams) {
      yield StudentExamsLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        final List<StudentExamModel> list =
            await repository.getStudentExamsList(token, userId);
        
        yield StudentExamsLoaded(list: list);
      } catch (e) {
        print(e.toString());
        yield StudentExamsError();
      }
    }
  }
}
