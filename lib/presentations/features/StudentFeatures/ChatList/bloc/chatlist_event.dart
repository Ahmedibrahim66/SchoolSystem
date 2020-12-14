part of 'chatlist_bloc.dart';

abstract class ChatlistEvent extends Equatable {
  const ChatlistEvent();

  @override
  List<Object> get props => [];
}

class FetchStudentChatList extends ChatlistEvent {

  FetchStudentChatList();

  @override
  List<Object> get props => [];

}
