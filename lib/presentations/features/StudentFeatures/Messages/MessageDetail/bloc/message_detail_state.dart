part of 'message_detail_bloc.dart';

abstract class MessageDetailState extends Equatable {
  const MessageDetailState();

  @override
  List<Object> get props => [];
}

class MessageDetailInitial extends MessageDetailState {}

class MessageDetailLoading extends MessageDetailState {}

class MessageDetailLoaded extends MessageDetailState {
  final MessageDetail message;

  MessageDetailLoaded(this.message);
}

class MessageDetailError extends MessageDetailState {}
