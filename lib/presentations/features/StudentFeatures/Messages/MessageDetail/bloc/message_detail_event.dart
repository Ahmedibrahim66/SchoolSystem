part of 'message_detail_bloc.dart';

abstract class MessageDetailEvent extends Equatable {
  const MessageDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchMessageDetail extends MessageDetailEvent {
  final String messageNo;
  FetchMessageDetail(this.messageNo);
}
