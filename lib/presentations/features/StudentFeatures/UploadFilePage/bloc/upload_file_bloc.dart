import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mustafa0_1/Data/DataSources/remoteData/studentRemoteDataSoruce.dart';
import 'package:mustafa0_1/Data/repositories/StudentRepositoryImp.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'upload_file_event.dart';
part 'upload_file_state.dart';

class UploadFileBloc extends Bloc<UploadFileEvent, UploadFileState> {
  UploadFileBloc() : super(UploadFileInitial());

  StudentRepository repository =
      new StudentRepositoryImp(new StudentRemoteDataSource());

  @override
  Stream<UploadFileState> mapEventToState(
    UploadFileEvent event,
  ) async* {
    if (event is UploadEvent) {
      yield UploadFileLoading();

      // try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String token = preferences.getString('userToken');
      String userId = preferences.getString('userId');

      bool success = await repository.submitHomeWork(
          token, userId, event.homeWorkSeq.toString(), event.files);

      if (success)
        yield UploadFileSuccessful();
      else
        yield UploadFileFailed();
      // } catch (e) {
      //   print(e);
      //   yield UploadFileFailed();
      // }
    }
  }
}
