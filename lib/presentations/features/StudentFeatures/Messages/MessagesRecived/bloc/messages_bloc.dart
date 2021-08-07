import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mustafa0_1/Data/models/SharedModels/Message.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc(this.repository) : super(MessagesInitial());
  final StudentRepository repository;

  @override
  Stream<MessagesState> mapEventToState(
    MessagesEvent event,
  ) async* {
    if (event is FetchMessages) {
      yield MessageLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        List<Message> messageList =
            await repository.getStudentMessages(token, userId, "A");

        yield MessageLoaded(messageList);
      } catch (e) {
        print(e.toString());
        yield MessageError();
      }
    }
  }
}
