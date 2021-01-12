import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/Data/models/StudentModels/examQuestionAnswerModel.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentExams/examSubmissionPage/bloc/exam_submission_bloc.dart';
import 'package:mustafa0_1/presentations/widgets/ExamWidgets/TextQuestionWidget.dart';
import 'package:mustafa0_1/presentations/widgets/ExamWidgets/multipleChoiceQuestionWidget.dart';
import 'package:mustafa0_1/presentations/widgets/ExamWidgets/trueFalseQuestionWidget.dart';

import 'package:mustafa0_1/presentations/widgets/LoadingAnimation.dart';

class ExamSubmissionPage extends StatefulWidget {
  final int examId;

  const ExamSubmissionPage({Key key, this.examId}) : super(key: key);

  @override
  _ExamSubmissionPageState createState() => _ExamSubmissionPageState();
}

class _ExamSubmissionPageState extends State<ExamSubmissionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              BlocProvider.of<ExamSubmissionBloc>(context)
                  .add(FetchStudentExamQuestion(widget.examId));
            },
            child: Icon(Icons.refresh)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_forward)),
          ),
        ],
        elevation: 0,
        backgroundColor: AppThemeData().primaryColor,
        centerTitle: true,
        title: Text(
          "GT Series",
          style: AppThemeData().lexendDecaText.copyWith(color: Colors.white),
        ),
      ),
      backgroundColor: AppThemeData().primaryColor,
      body: SingleChildScrollView(child: body()),
    );
  }

  Widget body() {
    return BlocBuilder<ExamSubmissionBloc, ExamSubmissionState>(
      builder: (context, state) {
        if (state is ExamSubmissionInitial) {
          BlocProvider.of<ExamSubmissionBloc>(context)
              .add(FetchStudentExamQuestion(widget.examId));
        } else if (state is ExamSubmissionPageLoading) {
          return Container(
              height: MediaQuery.of(context).size.height - 56,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(child: LoadingAnimation()));
        } else if (state is ExamSubmissionPageLoaded) {
          return state.list.length == 0
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.grey[900],
                  child: Text("لا يوجد اسئلة"),
                )
              : examQuestionLoadedBody(state.list[0], state.baseUrl);
        } else if (state is ExamSubmissionPageError) {
          return Container(
            color: Colors.grey[900],
            child: Text("فشل في الاتصال"),
          );
        } else if (state is ExamSubmissionPageFinished)
          return Container(
            color: Colors.grey[900],
            child: Text("تم انهاء الامتحان"),
          );
        return LoadingAnimation();
      },
    );
  }

  Widget examQuestionLoadedBody(
      ExamQuestionAnswerModel question, String baseUrl) {
    if (question.questionType == "1") {
      return MultipleChoiceQuestionWidget(
        examId: widget.examId,
        question: question,
        baseUrl: baseUrl,
      );
    } else if (question.questionType == "2") {
      //change the value of the multiChoiceQuestionAnswer variable
      return TrueFalseQuestionWidget(
        examId: widget.examId,
        question: question,
        baseUrl: baseUrl,
      );
    } else if (question.questionType == "3") {
      return TextQuestionWidget(
        examId: widget.examId,
        question: question,
        baseUrl: baseUrl,
      );
    }
    return Container();
  }
}
