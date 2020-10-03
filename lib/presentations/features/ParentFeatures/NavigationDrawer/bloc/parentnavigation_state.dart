part of 'parentnavigation_bloc.dart';

abstract class ParentnavigationState extends Equatable {
  const ParentnavigationState();
  
  @override
  List<Object> get props => [];
}

class ParentnavigationInitial extends ParentnavigationState {}

class ParentChildInitial extends ParentnavigationState {
  final List<ParentChildrenModel> children;
   const ParentChildInitial({@required this.children})
      : assert(children != null);
}

class ChildrenChange extends ParentnavigationState {
  final List<ParentChildrenModel> children;
   const ChildrenChange({@required this.children})
      : assert(children != null);
}

class ChildrenChanged extends ParentnavigationState {}
