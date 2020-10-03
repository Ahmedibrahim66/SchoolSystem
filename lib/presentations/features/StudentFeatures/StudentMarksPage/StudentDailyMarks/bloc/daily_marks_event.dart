part of 'daily_marks_bloc.dart';

abstract class DailyMarksEvent extends Equatable {
  const DailyMarksEvent();
}

class FetchStudentDailyMarks extends DailyMarksEvent {

  FetchStudentDailyMarks();

  @override
  List<Object> get props => [];

}


