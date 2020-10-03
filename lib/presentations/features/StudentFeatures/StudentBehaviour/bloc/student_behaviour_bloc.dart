import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mustafa0_1/Data/mappers/StudentMappers.dart';
import 'package:mustafa0_1/Data/models/BehaviourModel.dart';
import 'package:mustafa0_1/Domain/entities/student_behaviour_entity.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'student_behaviour_event.dart';
part 'student_behaviour_state.dart';

class StudentBehaviourBloc
    extends Bloc<StudentBehaviourEvent, StudentBehaviourState> {
  final StudentRepository repository;

  StudentBehaviourBloc(this.repository)
      : assert(repository != null),
        super(StudentBehaviourEmpty());

  @override
  Stream<StudentBehaviourState> mapEventToState(
    StudentBehaviourEvent event,
  ) async* {
    if (event is FetchStudentBehaviour) {

      yield StudentBehaviourLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        final List<StudentBehaviourModel> studentBehaviourModel =
            await repository.getStudentBehaviour(token, userId);
        final List<StudentBehaviourEntity> studentBehaviourEntity =
            StudentDataMapper.behaviourMapper(studentBehaviourModel);

        yield StudentBehaviourLoaded(studentBehaviourEntity:  studentBehaviourEntity);

        
      } catch (e) {
        print(e.toString());
        yield StudentBehaviourError();
      }
    }
  }
}
