import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mustafa0_1/Data/models/StudentModels/chatModel.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(this.roomchatId, this.repository, this.roomChatName) : super(ChatInitial());

  final String roomchatId;
  final String roomChatName;
  final StudentRepository repository;

  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    if (event is FetchChat) {
      yield ChatLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        final List<ChatModel> chatList =
            await repository.getChatListChat(token, userId , roomchatId);

        yield ChatLoaded(list: chatList , chatRoomName:roomChatName );
      } catch (e) {
        print(e.toString());
        yield ChatError();
      }
    }
    if(event is SendMessage){
       SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        await repository.sendChatMessaeg(token, userId, roomchatId, event.message);
        //message sent to server 
        
    }
  }
}
