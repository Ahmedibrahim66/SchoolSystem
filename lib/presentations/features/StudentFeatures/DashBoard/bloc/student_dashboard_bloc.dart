import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'student_dashboard_event.dart';
part 'student_dashboard_state.dart';

class StudentDashboardBloc
    extends Bloc<StudentDashboardEvent, StudentDashboardState> {
  StudentDashboardBloc() : super(StudentDashboardInitial());

  @override
  Stream<StudentDashboardState> mapEventToState(
    StudentDashboardEvent event,
  ) async* {
    if (event is LogOutButtonPressed) {
      yield LoggingOut();

      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userToken', null);
        prefs.setString('userId', null);
        yield LoggedOut();
      } catch (e) {
        yield LogOutError();
      }
    }
  }
}
