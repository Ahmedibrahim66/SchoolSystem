import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/Data/models/StudentModels/examQuestionAnswerModel.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentExams/examSubmissionPage/bloc/exam_submission_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrueFalseQuestionWidget extends StatefulWidget {
  final ExamQuestionAnswerModel question;
  final int examId;
  final String baseUrl;

  const TrueFalseQuestionWidget(
      {Key key, this.question, this.examId, this.baseUrl})
      : super(key: key);

  @override
  _TrueFalseQuestionWidgetState createState() =>
      _TrueFalseQuestionWidgetState();
}

class _TrueFalseQuestionWidgetState extends State<TrueFalseQuestionWidget> {
  String trueFalseQuestionAnswer = "";
  @override
  void initState() {
    if (widget.question.studentAnswer == "T") trueFalseQuestionAnswer = "صح";
    if (widget.question.studentAnswer == "F") trueFalseQuestionAnswer = "خطأ";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (widget.question.prevQ != "" ||
                      widget.question.canEdit == "Y") {
                    BlocProvider.of<ExamSubmissionBloc>(context).add(
                        PreviousExamQuestion(
                            widget.examId, int.parse(widget.question.prevQ)));
                  }
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: (widget.question.prevQ == "" ||
                            widget.question.canEdit == "N")
                        ? Colors.grey
                        : AppThemeData().secondaryColor,
                  ),
                  child: Center(
                    child: Text(
                      "السابق",
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              Text(
                " السؤال رقم ${widget.question.rowNo}",
                style: AppThemeData()
                    .tajwalText
                    .copyWith(color: Colors.white, fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  if (widget.question.nextQ != "") {
                    BlocProvider.of<ExamSubmissionBloc>(context).add(
                        NextExamQuestion(
                            widget.examId, int.parse(widget.question.nextQ)));
                  }
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: widget.question.nextQ == ""
                          ? Colors.grey
                          : AppThemeData().secondaryColor),
                  child: Center(
                    child: Text(
                      "التالي",
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 20,
          ),
          widget.question.qPhoto == null
              ? Container()
              : Image.network(
                  "http://${widget.baseUrl}/${widget.question.qPhoto}"),
          widget.question.rightAnswer == null
              ? Container()
              : SizedBox(
                  height: 20,
                ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppThemeData().thirdColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.question.questionDesc,
                      textAlign: TextAlign.end,
                      textDirection: TextDirection.rtl,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                SizedBox(width: 15),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          theAnswer(widget.question),
          SizedBox(
            height: 20,
          ),
          moveToNextQuestionButton(widget.question),
        ],
      ),
    );
  }

  Container theAnswer(ExamQuestionAnswerModel question) {
    return Container(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppThemeData().thirdColor),
          child: Column(
            children: [
              SizedBox(height: 20),
              multiChoiceQuestionAnswerWidget("صح", trueFalseQuestionAnswer),
              multiChoiceQuestionAnswerWidget("خطأ", trueFalseQuestionAnswer),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget multiChoiceQuestionAnswerWidget(String answer, String studentAnswer) {
    return answer == ""
        ? Container()
        : ListTile(
            title: Text(
              answer,
              style: AppThemeData()
                  .tajwalText
                  .copyWith(color: Colors.white, fontSize: 18),
            ),
            leading: Radio(
              activeColor: AppThemeData().secondaryColor,
              value: answer,
              groupValue: studentAnswer,
              onChanged: (String value) {
                setState(() {
                  trueFalseQuestionAnswer = value;
                });
              },
            ),
          );
  }

  Widget moveToNextQuestionButton(ExamQuestionAnswerModel question) {
    return GestureDetector(
      onTap: () {
        if (question.nextQ == "") {
          //we are on the last question pop view
          String answer;
          //get the number of the choosen answer
          if (trueFalseQuestionAnswer == "صح") answer = "T";
          if (trueFalseQuestionAnswer == "خطأ") answer = "F";

          BlocProvider.of<ExamSubmissionBloc>(context).add(
              SubmitExamQuestionAnswer(
                  widget.examId,
                  answer,
                  widget.question.seq.toString(),
                  "E",
                  widget.question.nextQ,
                  null));

          //pop view to go back to exams
          Navigator.pop(context);
        } else {
          // there is still question left go to next quesion

          String answer;
          //get the number of the choosen answer
          if (trueFalseQuestionAnswer == "صح") answer = "T";
          if (trueFalseQuestionAnswer == "خطأ") answer = "F";

          BlocProvider.of<ExamSubmissionBloc>(context).add(
              SubmitExamQuestionAnswer(
                  widget.examId,
                  answer.toString(),
                  widget.question.seq.toString(),
                  "N",
                  widget.question.nextQ,
                  null));
        }
      },
      child: Container(
          height: 55,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppThemeData().thirdColor),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              question.nextQ == ""
                  ? "لقد وصلت الى اخر سؤال اضغط للخروج"
                  : "تأكيد الأجابة والانتقال للسؤال التالي",
              textAlign: TextAlign.center,
              style: AppThemeData()
                  .tajwalText
                  .copyWith(color: Colors.white, fontSize: 16),
            ),
          ))),
    );
  }
}
