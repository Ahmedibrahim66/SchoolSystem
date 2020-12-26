import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mustafa0_1/Data/mappers/StudentMappers.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentLearningMaterialModel.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_learning_material.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'studentlearnnigmaterial_event.dart';
part 'studentlearnnigmaterial_state.dart';

class StudentLearningMaterialBloc
    extends Bloc<StudentlearnnigmaterialEvent, StudentlearnnigmaterialState> {

  final StudentRepository repository;

  StudentLearningMaterialBloc(this.repository)
      : assert(repository != null),
        super(StudentlearnnigmaterialEmpty());

  @override
  Stream<StudentlearnnigmaterialState> mapEventToState(
    StudentlearnnigmaterialEvent event,
  ) async* {
 if (event is FetchStudentLearningMaterial) {
      yield StudentlearnnigmaterialLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        final List<StudentLearningMaterialModel> list =
            await repository.getStudentLearningMaterial(token, userId);
        yield StudentlearnnigmaterialLoaded(list:  list);
        print(list.length);
      } catch (e) {
        print(e.toString());
        yield StudentlearnnigmaterialError();
      }
    }   }
}
