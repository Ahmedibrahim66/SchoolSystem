import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mustafa0_1/Data/mappers/StudentMappers.dart';
import 'package:mustafa0_1/Data/models/StudentAbsenceModel.dart';
import 'package:mustafa0_1/Domain/entities/student_absence_entity.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'student_attendence_event.dart';
part 'student_attendence_state.dart';

class StudentAttendenceBloc
    extends Bloc<StudentAttendenceEvent, StudentAttendenceState> {
  final StudentRepository repository;

  StudentAttendenceBloc(this.repository)
      : assert(repository != null),
        super(StudentAbsenceEmpty());

  @override
  Stream<StudentAttendenceState> mapEventToState(
    StudentAttendenceEvent event,
  ) async* {
        if (event is FetchStudentAbsence) {
      yield StudentAbsenceLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        final List<StudentAbsenceModel> studentAbsencelistModel =
            await repository.getStudentAbsence(token, userId);
        final List<StudentAbsenceEntity> studentAbsencelist =  StudentDataMapper.absenceMapper(studentAbsencelistModel);
        yield StudentAbsenceLoaded(list:  studentAbsencelist);
      } catch (e) {
        print(e.toString());
        yield StudentAbsenceError();
      }
    }
  }
}
