part of 'studentmarks_bloc.dart';

abstract class StudentmarksState extends Equatable {
  const StudentmarksState();
  
  @override
  List<Object> get props => [];
}

class StudentmarksInitial extends StudentmarksState {}
class StudentDailyMarksState extends StudentmarksState {}
class StudentQuarterMarksState extends StudentmarksState {}
