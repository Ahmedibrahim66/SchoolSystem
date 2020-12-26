part of 'studentlearnnigmaterial_bloc.dart';

abstract class StudentlearnnigmaterialState extends Equatable {
  const StudentlearnnigmaterialState();
  
  @override
  List<Object> get props => [];
}


class StudentlearnnigmaterialEmpty extends StudentlearnnigmaterialState {}

class StudentlearnnigmaterialLoading extends StudentlearnnigmaterialState{}

class StudentlearnnigmaterialLoaded extends StudentlearnnigmaterialState {
  final List<StudentLearningMaterialModel> list;

  const StudentlearnnigmaterialLoaded({@required this.list})
      : assert(list != null);

  @override
  List<Object> get props => [list];
}

class StudentlearnnigmaterialError extends StudentlearnnigmaterialState {}
