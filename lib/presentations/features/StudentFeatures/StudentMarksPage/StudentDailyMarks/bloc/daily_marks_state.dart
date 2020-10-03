part of 'daily_marks_bloc.dart';

abstract class DailyMarksState extends Equatable {
  const DailyMarksState();
    @override
  List<Object> get props => [];

}

class StudentDailyMarksEmpty extends DailyMarksState {}

class StudentDailyMarksLoading extends DailyMarksState{}

class StudentDailyMarksLoaded extends DailyMarksState {
  final List<DailyMarksEntity> dailyMarksList;

  const StudentDailyMarksLoaded({@required this.dailyMarksList})
      : assert(dailyMarksList != null);

  @override
  List<Object> get props => [dailyMarksList];
}

class StudentDailyMarksError extends DailyMarksState {}


