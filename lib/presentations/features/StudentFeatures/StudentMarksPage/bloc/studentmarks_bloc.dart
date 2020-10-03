import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'studentmarks_event.dart';
part 'studentmarks_state.dart';

class StudentmarksBloc extends Bloc<StudentmarksEvent, StudentmarksState> {
  StudentmarksBloc() : super(StudentDailyMarksState());

  @override
  Stream<StudentmarksState> mapEventToState(
    StudentmarksEvent event,
  ) async* {
    if (event is NavigateToStudentDailyMarks) {
      yield StudentDailyMarksState();
    }
    if (event is NavigateToStudentQuarterMarks) {
      yield StudentQuarterMarksState();
    }
    
  }
}
