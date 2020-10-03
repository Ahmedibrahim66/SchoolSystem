import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mustafa0_1/Data/mappers/StudentMappers.dart';
import 'package:mustafa0_1/Data/models/StudentLateModel.dart';
import 'package:mustafa0_1/Domain/entities/student_late_entity.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'studentlate_event.dart';
part 'studentlate_state.dart';

class StudentlateBloc extends Bloc<StudentlateEvent, StudentlateState> {
 StudentlateBloc(this.repository)
      : assert(repository != null),
        super(StudentLateEmpty());  final StudentRepository repository;

  @override
  Stream<StudentlateState> mapEventToState(
    StudentlateEvent event,
  ) async* {
      if (event is FetchStudentLate) {
      yield StudentLateLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        final List<StudentLateModel> studentLatelistModel =
            await repository.getStudentLate(token, userId);
        final List<StudentLateEntity> studentLatelist =  StudentDataMapper.lateMapper(studentLatelistModel);
        yield StudentLateLoaded(list:  studentLatelist);
      } catch (e) {
        print(e.toString());
        yield StudentLateError();
      }
    }
  }
}
