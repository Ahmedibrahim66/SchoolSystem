part of 'studentnavigation_bloc.dart';

abstract class StudentnavigationEvent extends Equatable {
  const StudentnavigationEvent();

  @override
  List<Object> get props => [];
}


class LogoutEvent extends StudentnavigationEvent {
  final BuildContext context;
  LogoutEvent(this.context) : assert(context != null);
}

class NavigateToHomeScreen extends StudentnavigationEvent {
final BuildContext context;
  NavigateToHomeScreen(this.context) : assert(context != null);
}

class NavigateToStudentProfile extends StudentnavigationEvent {
final BuildContext context;
  NavigateToStudentProfile(this.context) : assert(context != null);
}

class NavigateToStudentGrades extends StudentnavigationEvent {
final BuildContext context;
  NavigateToStudentGrades(this.context) : assert(context != null);
}

class NavigateToStudentPayment extends StudentnavigationEvent {
final BuildContext context;
  NavigateToStudentPayment(this.context) : assert(context != null);
}

class NavigateToStudentLeaningMaterial extends StudentnavigationEvent {
final BuildContext context;
  NavigateToStudentLeaningMaterial(this.context) : assert(context != null);
}

class ChooseChild extends StudentnavigationEvent {
final BuildContext context;
  ChooseChild(this.context) : assert(context != null);
}






