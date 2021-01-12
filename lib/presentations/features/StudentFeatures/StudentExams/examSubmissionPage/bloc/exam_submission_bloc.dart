import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mustafa0_1/Data/models/StudentModels/examQuestionAnswerModel.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'exam_submission_event.dart';
part 'exam_submission_state.dart';

class ExamSubmissionBloc
    extends Bloc<ExamSubmissionEvent, ExamSubmissionState> {
  ExamSubmissionBloc(this.repository) : super(ExamSubmissionInitial());
  final StudentRepository repository;

  @override
  Stream<ExamSubmissionState> mapEventToState(
    ExamSubmissionEvent event,
  ) async* {
    if (event is FetchStudentExamQuestion) {
      yield ExamSubmissionPageLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');

        //TODO:: remove the set string and added to the choose school page
        await preferences.setString("baseURL", "gtseries.net/uploads");
        String baseUrl = preferences.getString("baseURL");

        final List<ExamQuestionAnswerModel> list =
            await repository.showStudentExam(token, userId, event.examId);

        yield ExamSubmissionPageLoaded(list: list, baseUrl: baseUrl);
      } catch (e) {
        print(e.toString());
        yield ExamSubmissionPageError();
      }
    }

    if (event is NextExamQuestion) {
      yield ExamSubmissionPageLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');

        //TODO:: remove the set string and added to the choose school page
        await preferences.setString("baseURL", "gtseries.net/uploads");
        String baseUrl = preferences.getString("baseURL");

        final List<ExamQuestionAnswerModel> list =
            await repository.showSelectedQuestion(
                token, userId, event.examId, event.nextQuestion);

        yield ExamSubmissionPageLoaded(list: list, baseUrl: baseUrl);
      } catch (e) {
        print(e.toString());
        yield ExamSubmissionPageError();
      }
    }

    if (event is PreviousExamQuestion) {
      yield ExamSubmissionPageLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        //TODO:: remove the set string and added to the choose school page
        await preferences.setString("baseURL", "gtseries.net/uploads");
        String baseUrl = preferences.getString("baseURL");

        final List<ExamQuestionAnswerModel> list =
            await repository.showSelectedQuestion(
                token, userId, event.examId, event.nextQuestion);

        yield ExamSubmissionPageLoaded(list: list, baseUrl: baseUrl);
      } catch (e) {
        print(e.toString());
        yield ExamSubmissionPageError();
      }
    }

    if (event is SubmitExamQuestionAnswer) {
      yield ExamSubmissionPageLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');

        //TODO:: remove the set string and added to the choose school page
        await preferences.setString("baseURL", "gtseries.net/uploads");
        String baseUrl = preferences.getString("baseURL");

        String submission = await repository.submitQuestionAnswer(
            token,
            userId,
            event.examId,
            int.parse(event.questionId),
            event.answer,
            event.isEnd);
        if (event.isEnd == "E") {
          //exam is finished wait for view pop
          yield ExamSubmissionPageLoading();
        } else {
          if (submission == "Right") {
            // submission is correct
            final List<ExamQuestionAnswerModel> list =
                await repository.showSelectedQuestion(
                    token, userId, event.examId, int.parse(event.nextQeustion));
            yield ExamSubmissionPageLoaded(list: list, baseUrl: baseUrl);
          } else {
            //submission is wrong
            yield ExamSubmissionPageError();
          }
        }
      } catch (e) {
        print(e.toString());
        yield ExamSubmissionPageError();
      }
    }
  }
}
