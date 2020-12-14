import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mustafa0_1/Data/models/StudentModels/ZoomLinksModel.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'zoom_links_event.dart';
part 'zoom_links_state.dart';

class ZoomLinksBloc extends Bloc<ZoomLinksEvent, ZoomLinksState> {
  ZoomLinksBloc(this.repository) : super(ZoomLinksInitial());
  final StudentRepository repository;

  @override
  Stream<ZoomLinksState> mapEventToState(
    ZoomLinksEvent event,
  ) async* {
      if (event is FetchZoomLinks) {
      yield ZoomLinksLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        final List<ZoomLinkModel> list =
            await repository.getZoomLinks(token, userId);
        yield ZoomLinksLoaded(list: list);
      } catch (e) {
        print(e.toString());
        yield ZoomLinksError();
      }
    }
  }
}
