import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mustafa0_1/Data/DataSources/remoteData/studentRemoteDataSoruce.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentHomeworkMaterialSubmission.dart';
import 'package:mustafa0_1/Data/repositories/StudentRepositoryImp.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'view_submission_event.dart';
part 'view_submission_state.dart';

class ViewSubmissionBloc
    extends Bloc<ViewSubmissionEvent, ViewSubmissionState> {
  ViewSubmissionBloc() : super(ViewSubmissionInitial());

  StudentRepository repository =
      new StudentRepositoryImp(new StudentRemoteDataSource());
  @override
  Stream<ViewSubmissionState> mapEventToState(
    ViewSubmissionEvent event,
  ) async* {
    if (event is ViewHomeworkSubmission) {
      yield StudentHomeworkSubmissionLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        final List<StudentHomeworkMaterialSubmission> list =
            await repository.getStudentHomeworkMaterialSubmissions(
                token, userId, event.homewrokSeq);
        yield StudentHomeworkSubmissionLoaded(list);
      } catch (e) {
        print(e.toString());
        yield StudentHomeworkSubmissionFailed();
      }
    }
  }
}
