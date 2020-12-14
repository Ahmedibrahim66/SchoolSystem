part of 'chatlist_bloc.dart';

abstract class ChatlistState extends Equatable {
  const ChatlistState();
  
  @override
  List<Object> get props => [];
}

class ChatlistInitial extends ChatlistState {}

class ChatListLoading extends ChatlistState{}

class ChatListLoaded extends ChatlistState {
  final List<ChatListModel> list;

  const ChatListLoaded({@required this.list})
      : assert(list != null);

  @override
  List<Object> get props => [list];
}

class ChatListError extends ChatlistState {}

