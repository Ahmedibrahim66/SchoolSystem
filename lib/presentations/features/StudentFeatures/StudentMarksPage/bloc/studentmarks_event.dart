part of 'studentmarks_bloc.dart';

abstract class StudentmarksEvent extends Equatable {
  const StudentmarksEvent();

  @override
  List<Object> get props => [];
}

class NavigateToStudentDailyMarks extends StudentmarksEvent {}
class NavigateToStudentQuarterMarks extends StudentmarksEvent {}
