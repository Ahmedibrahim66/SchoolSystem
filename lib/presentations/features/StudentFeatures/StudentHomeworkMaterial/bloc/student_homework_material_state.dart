part of 'student_homework_material_bloc.dart';

abstract class StudentHomeworkMaterialState extends Equatable {
  const StudentHomeworkMaterialState();

  @override
  List<Object> get props => [];
}

class StudentHomeworkMaterialInitial extends StudentHomeworkMaterialState {}

class StudentHomeworkMaterialLoading extends StudentHomeworkMaterialState {}

class StudentHomeworkMaterialLoaded extends StudentHomeworkMaterialState {
  final List<StudentsHomeworkMaterialModel> list;

  const StudentHomeworkMaterialLoaded({@required this.list})
      : assert(list != null);

  @override
  List<Object> get props => [list];
}

class StudentHomeworkMaterialError extends StudentHomeworkMaterialState {}
