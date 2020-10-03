part of 'parentnavigation_bloc.dart';

abstract class ParentnavigationEvent extends Equatable {
  const ParentnavigationEvent();

  @override
  List<Object> get props => [];
}

class FetchParentChildrensEvent extends ParentnavigationEvent{}

class ChangeChildrensEvent extends ParentnavigationEvent{}

class NewChildrensChoosenEvent extends ParentnavigationEvent{
  final String userId;

  NewChildrensChoosenEvent(this.userId);


}
