part of 'login_first_stage_bloc.dart';

abstract class LoginFirstStageState extends Equatable {
  const LoginFirstStageState();
  
  @override
  List<Object> get props => [];
}

class LoginFirstStageInitial extends LoginFirstStageState {}

class TeacherTypeChoosen extends LoginFirstStageState {}
class ParentTypeChoosen extends LoginFirstStageState {}
class StudentTypeChoosen extends LoginFirstStageState {}
class ManagmentTypeChoosen extends LoginFirstStageState {}
