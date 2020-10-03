import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mustafa0_1/Data/models/ParentModels/ParentChildrenModels.dart';
import 'package:mustafa0_1/Domain/repositories/parentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'parentnavigation_event.dart';
part 'parentnavigation_state.dart';

class ParentnavigationBloc
    extends Bloc<ParentnavigationEvent, ParentnavigationState> {
  final ParentRepository repository;
  ParentnavigationBloc(this.repository)
      : assert(repository != null),
        super(ParentnavigationInitial());

  @override
  Stream<ParentnavigationState> mapEventToState(
    ParentnavigationEvent event,
  ) async* {
    if (event is FetchParentChildrensEvent) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String token = preferences.getString('userToken');
      String userId = preferences.getString('ParentId');
      List<ParentChildrenModel> list =
          await repository.getParentChildrens(token, userId);
      await preferences.setString('userId', list[0].studentNo);

      yield ParentChildInitial(children: list);
    }
    if (event is ChangeChildrensEvent) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String token = preferences.getString('userToken');
      String userId = preferences.getString('ParentId');
      List<ParentChildrenModel> list =
          await repository.getParentChildrens(token, userId);
      yield ChildrenChange(children: list);
    }

    if (event is NewChildrensChoosenEvent) {

      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('userId', event.userId);
      yield ParentChildInitial(children: []);
    }
  }
}
