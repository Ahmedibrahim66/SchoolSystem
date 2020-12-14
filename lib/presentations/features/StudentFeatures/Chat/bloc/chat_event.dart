part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class FetchChat extends ChatEvent {

  FetchChat();

  @override
  List<Object> get props => [];

}

class SendMessage extends ChatEvent {

  final String message;
  SendMessage(this.message);

  @override
  List<Object> get props => [];

}


