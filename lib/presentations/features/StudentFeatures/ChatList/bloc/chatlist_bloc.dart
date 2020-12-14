import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mustafa0_1/Data/models/StudentModels/ChatListModel.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'chatlist_event.dart';
part 'chatlist_state.dart';

class ChatlistBloc extends Bloc<ChatlistEvent, ChatlistState> {
    ChatlistBloc(this.repository)
      : assert(repository != null),
        super(ChatlistInitial());  
        final StudentRepository repository;

  @override
  Stream<ChatlistState> mapEventToState(
    ChatlistEvent event,
  ) async* {
    if (event is FetchStudentChatList) {
      yield ChatListLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        final List<ChatListModel> chatList =
            await repository.getStudentChatList(token, userId);
        
        yield ChatListLoaded(list: chatList);
      } catch (e) {
        print(e.toString());
        yield ChatListError();
      }
    }
  }
}
