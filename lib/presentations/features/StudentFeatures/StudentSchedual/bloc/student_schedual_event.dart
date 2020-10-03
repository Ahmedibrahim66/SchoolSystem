part of 'student_schedual_bloc.dart';

abstract class StudentSchedualEvent extends Equatable {
  const StudentSchedualEvent();
}

class FetchStudentSchedual extends StudentSchedualEvent {
  @override
  List<Object> get props => [];
}

class NextWeekSchedual extends StudentSchedualEvent {
  @override
  List<Object> get props => [];
}

class PrevoiusWeekSchedual extends StudentSchedualEvent {
  @override
  List<Object> get props => [];
}

class NewDayChoosenWeekSchedual extends StudentSchedualEvent {
  final int day;

  const NewDayChoosenWeekSchedual({
    @required this.day,
  });

  @override
  List<Object> get props => [];
}
