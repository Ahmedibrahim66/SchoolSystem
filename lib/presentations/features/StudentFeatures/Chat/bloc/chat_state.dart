part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();
  
  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}


class ChatLoading extends ChatState{}

class ChatLoaded extends ChatState {
  final List<ChatModel> list;
  final String chatRoomName;

  const ChatLoaded({@required this.list , @required this.chatRoomName,})
      : assert(list != null);

  @override
  List<Object> get props => [list];
}

class ChatError extends ChatState {}

