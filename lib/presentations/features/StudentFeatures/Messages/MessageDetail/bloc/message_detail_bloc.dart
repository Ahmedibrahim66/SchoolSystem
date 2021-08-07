import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mustafa0_1/Data/models/SharedModels/MessageDetail.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'message_detail_event.dart';
part 'message_detail_state.dart';

class MessageDetailBloc extends Bloc<MessageDetailEvent, MessageDetailState> {
  MessageDetailBloc(this.repository) : super(MessageDetailInitial());
  final StudentRepository repository;

  @override
  Stream<MessageDetailState> mapEventToState(
    MessageDetailEvent event,
  ) async* {
    if (event is FetchMessageDetail) {
      yield MessageDetailLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        MessageDetail messageList = await repository.getStudentMessageDetail(
            token, userId, event.messageNo);

        yield MessageDetailLoaded(messageList);
      } catch (e) {
        print(e.toString());
        yield MessageDetailError();
      }
    }
  }
}
