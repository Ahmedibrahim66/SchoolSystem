import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/Data/models/StudentModels/examQuestionAnswerModel.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentExams/examSubmissionPage/bloc/exam_submission_bloc.dart';

class TextQuestionWidget extends StatefulWidget {
  final ExamQuestionAnswerModel question;
  final int examId;

  const TextQuestionWidget({Key key, this.question, this.examId})
      : super(key: key);

  @override
  _TextQuestionWidgetState createState() => _TextQuestionWidgetState();
}

class _TextQuestionWidgetState extends State<TextQuestionWidget> {
  Key _formKey3;
  TextEditingController textFieldQuestionAnswerController =
      TextEditingController();

  @override
  void initState() {
    print(widget.question.textAnswer);
    textFieldQuestionAnswerController.text = widget.question.textAnswer;
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

          // Image.network(""),
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

  Column theAnswer(ExamQuestionAnswerModel question) {
    return Column(
      children: [
        Form(
          key: _formKey3,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              controller: textFieldQuestionAnswerController,
              maxLines: 30,
              minLines: 15,
              // initialValue: textFieldQuestionAnswerController.text == null
              //     ? ""
              //     : widget.question.studentAnswer,
              decoration: inputdecoration(
                  "اجابة الطالب", "${widget.question.studentAnswer}"),
              // onChanged: (String val) {

              // },
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        // Container(
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10),
        //       color: AppThemeData().thirdColor),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     children: [
        //       SizedBox(
        //         height: 20,
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           Container(
        //             child: Text(
        //               "ملاحظات المعلم",
        //               style: AppThemeData()
        //                   .tajwalText
        //                   .copyWith(color: Colors.white, fontSize: 16),
        //             ),
        //           ),
        //           SizedBox(
        //             width: 20,
        //           ),
        //         ],
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           Expanded(
        //             child: Text(
        //               question.teacherRemarks == null
        //                   ? ""
        //                   : question.teacherRemarks,
        //               textAlign: TextAlign.right,
        //               textDirection: TextDirection.rtl,
        //               style: AppThemeData()
        //                   .tajwalText
        //                   .copyWith(color: Colors.white, fontSize: 16),
        //             ),
        //           ),
        //           SizedBox(
        //             width: 20,
        //           ),
        //         ],
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  inputdecoration(String labelText, String hintText) {
    return InputDecoration(
      labelText: labelText == null ? "" : '$labelText',
      hintText: hintText == null ? "" : '$hintText',
      helperText: '',
      fillColor: AppThemeData().primaryColor,
      filled: true,
      hintStyle: TextStyle(color: Colors.white60),
      labelStyle: TextStyle(color: Colors.white),

      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

      //errorStyle: TextStyle(fontSize: 0),
      alignLabelWithHint: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Colors.white),
        //borderRadius: BorderRadius.circular(100),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Colors.blue, width: 2),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
    );
  }

  Widget moveToNextQuestionButton(ExamQuestionAnswerModel question) {
    return GestureDetector(
      onTap: () {
        if (question.nextQ == "") {
          //we are on the last question pop view

          String answer = textFieldQuestionAnswerController.text;

          BlocProvider.of<ExamSubmissionBloc>(context).add(
              SubmitExamQuestionAnswer(widget.examId, answer,
                  widget.question.seq.toString(), "E", widget.question.nextQ));

          Navigator.pop(context);
        } else {
          // there is still question left go to next quesion
          String answer = textFieldQuestionAnswerController.text;

          BlocProvider.of<ExamSubmissionBloc>(context).add(
              SubmitExamQuestionAnswer(widget.examId, answer.toString(),
                  widget.question.seq.toString(), "N", widget.question.nextQ));
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
