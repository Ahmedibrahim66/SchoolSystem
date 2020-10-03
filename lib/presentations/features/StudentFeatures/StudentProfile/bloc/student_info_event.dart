part of 'student_info_bloc.dart';

@immutable
abstract class StudentInfoEvent extends Equatable{
}

class FetchStudentInfo extends StudentInfoEvent {

  FetchStudentInfo();

  @override
  List<Object> get props => [];

}
