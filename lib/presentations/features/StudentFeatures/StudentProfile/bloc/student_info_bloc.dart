import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mustafa0_1/Data/mappers/StudentMappers.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentInfoModel.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_info_entity.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'student_info_event.dart';
part 'student_info_state.dart';

class StudentInfoBloc extends Bloc<StudentInfoEvent, StudentInfoState> {
  final StudentRepository repository;

  StudentInfoBloc(this.repository)
      : assert(repository != null),
        super(StudentInfoEmpty());

  @override
  Stream<StudentInfoState> mapEventToState(
    StudentInfoEvent event,
  ) async* {
    if (event is FetchStudentInfo) {
      yield StudentInfoLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        final StudentInfoModel studentInfoModel =
            await repository.getStudentInfo(token, userId);
        final StudentInfoEntity studentInfoEntity =  StudentDataMapper.infoMapper(studentInfoModel);
        yield StudentInfoLoaded(studentInfoEntity: studentInfoEntity);
      } catch (e) {
        print(e.toString());
        yield StudentInfoError();
      }
    }
  }
}
