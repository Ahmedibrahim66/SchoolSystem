part of 'send_message_bloc.dart';

abstract class SendMessageEvent extends Equatable {
  const SendMessageEvent();

  @override
  List<Object> get props => [];
}

class FetchTeaachers extends SendMessageEvent {}

class SendMessage extends SendMessageEvent {}
