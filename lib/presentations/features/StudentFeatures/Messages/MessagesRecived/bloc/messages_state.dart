part of 'messages_bloc.dart';

abstract class MessagesState extends Equatable {
  const MessagesState();

  @override
  List<Object> get props => [];
}

class MessagesInitial extends MessagesState {}

class MessageLoading extends MessagesState {}

class MessageLoaded extends MessagesState {
  final List<Message> list;

  MessageLoaded(this.list);
}

class MessageError extends MessagesState {}
