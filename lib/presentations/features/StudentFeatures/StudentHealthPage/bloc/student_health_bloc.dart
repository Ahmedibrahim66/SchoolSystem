import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mustafa0_1/Data/mappers/StudentMappers.dart';
import 'package:mustafa0_1/Data/models/StudentHealthModel.dart';
import 'package:mustafa0_1/Domain/entities/student_health_entity.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'student_health_event.dart';
part 'student_health_state.dart';

class StudentHealthBloc extends Bloc<StudentHealthEvent, StudentHealthState> {
  StudentHealthBloc(this.repository)
      : assert(repository != null),
        super(StudentHealthEmpty());  final StudentRepository repository;

  @override
  Stream<StudentHealthState> mapEventToState(
    StudentHealthEvent event,
  ) async* {
    if (event is FetchStudentHealth) {
      yield StudentHealthLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        final List<StudentHealthModel> studentLatelistModel =
            await repository.getStudentHealth(token, userId);
        final List<StudentHealthEntity> studentLatelist =  StudentDataMapper.healthMapper(studentLatelistModel);
        yield StudentHealthLoaded(list:  studentLatelist);
      } catch (e) {
        print(e.toString());
        yield StudentHealthError();
      }
    }
  }
}
