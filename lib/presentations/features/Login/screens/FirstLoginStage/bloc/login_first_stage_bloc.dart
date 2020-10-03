import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_first_stage_event.dart';
part 'login_first_stage_state.dart';

class LoginFirstStageBloc extends Bloc<LoginFirstStageEvent, LoginFirstStageState> {
  LoginFirstStageBloc() : super(LoginFirstStageInitial());

  @override
  Stream<LoginFirstStageState> mapEventToState(
    LoginFirstStageEvent event,
  ) async* {

    if(event is ChooseBackToFirstScreen){
      yield LoginFirstStageInitial();
    }
    if(event is ChooseParentType){
      yield ParentTypeChoosen();
    }
    if(event is ChooseStudentType){
      yield StudentTypeChoosen();
    }
    if(event is ChooseTeacherType){
      yield TeacherTypeChoosen();
    }
    if(event is ChooseManagemntType){
      yield ManagmentTypeChoosen();
    }
  }
}
