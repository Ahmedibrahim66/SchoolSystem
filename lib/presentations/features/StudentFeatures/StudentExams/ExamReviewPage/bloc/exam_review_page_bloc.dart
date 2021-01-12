import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mustafa0_1/Data/models/StudentModels/ExamQuestionReviewModel.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'exam_review_page_event.dart';
part 'exam_review_page_state.dart';

class ExamReviewPageBloc
    extends Bloc<ExamReviewPageEvent, ExamReviewPageState> {
  final StudentRepository repository;

  ExamReviewPageBloc(this.repository) : super(ExamReviewPageInitial());

  @override
  Stream<ExamReviewPageState> mapEventToState(
    ExamReviewPageEvent event,
  ) async* {
    if (event is FetchStudentExamQuestion) {
      yield ExamReviewPageLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');

        //TODO:: remove the set string and added to the choose school page
        await preferences.setString("baseURL", "gtseries.net/uploads");
        String baseUrl = preferences.getString("baseURL");

        final List<ExamQuestionReviewModel> list = await repository
            .enterStudentExamReview(token, userId, event.examId);

        yield ExamReviewPageLoaded(list: list, baseUrl: baseUrl);
      } catch (e) {
        print(e.toString());
        yield ExamReviewPageError();
      }
    }

    if (event is NextExamQuestion) {
      yield ExamReviewPageLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');

        //TODO:: remove the set string and added to the choose school page
        await preferences.setString("baseURL", "gtseries.net/uploads");
        String baseUrl = preferences.getString("baseURL");

        final List<ExamQuestionReviewModel> list =
            await repository.getStudentExamReviewQuestion(
                token, userId, event.examId, event.nextQuestion);

        yield ExamReviewPageLoaded(list: list, baseUrl: baseUrl);
      } catch (e) {
        print(e.toString());
        yield ExamReviewPageError();
      }
    }

    if (event is PreviousExamQuestion) {
      yield ExamReviewPageLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');

        //TODO:: remove the set string and added to the choose school page
        await preferences.setString("baseURL", "gtseries.net/uploads");
        String baseUrl = preferences.getString("baseURL");

        print("bloc is ${event.examId} and ${event.nextQuestion}");
        final List<ExamQuestionReviewModel> list =
            await repository.getStudentExamReviewQuestion(
                token, userId, event.examId, event.nextQuestion);

        yield ExamReviewPageLoaded(list: list, baseUrl: baseUrl);
      } catch (e) {
        print(e.toString());
        yield ExamReviewPageError();
      }
    }
  }
}
