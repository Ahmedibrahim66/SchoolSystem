part of 'student_schedual_bloc.dart';

abstract class StudentSchedualState extends Equatable {
  const StudentSchedualState();

  @override
  List<Object> get props => [];
}

class StudentSchedualEmpty extends StudentSchedualState {}

class StudentScheualMockState extends StudentSchedualState {}


class StudentSchedualLoading extends StudentSchedualState {
  final int loadingNumber;

  const StudentSchedualLoading({this.loadingNumber})
      : assert(loadingNumber != null);
}

class StudentSchedualLoaded extends StudentSchedualState {
  final List<List<ScheduleSubjectEntity>> schedule;
  final List<DaysOfWeekModel> daysOfWeek;
  final List<List<List<StudentHomeworkAndExams>>> homeworksAndExams;

  const StudentSchedualLoaded(
      {@required this.schedule,
      @required this.daysOfWeek,
      this.homeworksAndExams})
      : assert(schedule != null),
        assert(homeworksAndExams != null),
        assert(daysOfWeek != null);

  @override
  List<Object> get props => [schedule, daysOfWeek];
}

class StudentSchedualEror extends StudentSchedualState {}

class StudentHomeWorkAndExamsLoaded extends StudentSchedualState {
  final List<List<List<StudentHomeworkAndExams>>> homeworksAndExams;

  const StudentHomeWorkAndExamsLoaded({@required this.homeworksAndExams})
      : assert(homeworksAndExams != null);
}

class StudentHomeWorkAndExamsLoading extends StudentSchedualState {
  final List<List<ScheduleSubjectEntity>> schedule;
  final List<DaysOfWeekModel> daysOfWeek;
  final List<List<List<StudentHomeworkAndExams>>> homeworksAndExams;

  const StudentHomeWorkAndExamsLoading(
      {@required this.schedule,
      @required this.daysOfWeek,
      this.homeworksAndExams})
      : assert(schedule != null),
        assert(homeworksAndExams != null),
        assert(daysOfWeek != null);
}

class StudentNewWeekSchedualLoading extends StudentSchedualState {}
