import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentHomeworkMaterialModel.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'student_homework_material_event.dart';
part 'student_homework_material_state.dart';

class StudentHomeworkMaterialBloc
    extends Bloc<StudentHomeworkMaterialEvent, StudentHomeworkMaterialState> {
  StudentHomeworkMaterialBloc(this.repository)
      : super(StudentHomeworkMaterialInitial());
  final StudentRepository repository;

  @override
  Stream<StudentHomeworkMaterialState> mapEventToState(
    StudentHomeworkMaterialEvent event,
  ) async* {
    if (event is FetchStudentHomeworkMaterial) {
      yield StudentHomeworkMaterialLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        final List<StudentsHomeworkMaterialModel> list =
            await repository.getStudentHomeworkMaterial(token, userId);
        yield StudentHomeworkMaterialLoaded(list: list);
      } catch (e) {
        print(e.toString());
        yield StudentHomeworkMaterialError();
      }
    }
  }
}
