import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mustafa0_1/Data/mappers/StudentMappers.dart';
import 'package:mustafa0_1/Data/models/DailyMarksModel.dart';
import 'package:mustafa0_1/Domain/entities/student_daily_marks_entity.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'daily_marks_event.dart';
part 'daily_marks_state.dart';

class DailyMarksBloc extends Bloc<DailyMarksEvent, DailyMarksState> {
  final StudentRepository repository;

  DailyMarksBloc({this.repository})
      : assert(repository != null),
        super(StudentDailyMarksEmpty());

  @override
  Stream<DailyMarksState> mapEventToState(
    DailyMarksEvent event,
  ) async* {
    if (event is FetchStudentDailyMarks) {
      yield StudentDailyMarksLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        final List<DailyMarksModel> studentDailyMarksList =
            await repository.getStudentDailyMarks(token, userId);
        
        final List<DailyMarksEntity> studentDailyMarksEntity =
            StudentDataMapper.dailyMarksMaper(studentDailyMarksList);
        print("after mapping");

        yield StudentDailyMarksLoaded(dailyMarksList: studentDailyMarksEntity);
      } catch (e) {
        print(e.toString());
        yield StudentDailyMarksError();
      }
    }
  }
}
