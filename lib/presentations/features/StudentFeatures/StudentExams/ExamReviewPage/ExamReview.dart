import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/Data/models/StudentModels/ExamQuestionReviewModel.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentExams/ExamReviewPage/bloc/exam_review_page_bloc.dart';
import 'package:mustafa0_1/presentations/widgets/LoadingAnimation.dart';
import 'package:url_launcher/url_launcher.dart';

class ExamReviewPage extends StatefulWidget {
  final int examId;

  const ExamReviewPage({Key key, this.examId}) : super(key: key);
  @override
  _ExamReviewPageState createState() => _ExamReviewPageState();
}

class _ExamReviewPageState extends State<ExamReviewPage> {
  String multiChoiceQuestionAnswer;
  String trueFalseQuestionAnswer;
  Key _formKey3;
  TextEditingController textFieldQuestionAnswerController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              BlocProvider.of<ExamReviewPageBloc>(context)
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
    return BlocBuilder<ExamReviewPageBloc, ExamReviewPageState>(
      builder: (context, state) {
        if (state is ExamReviewPageInitial) {
          BlocProvider.of<ExamReviewPageBloc>(context)
              .add(FetchStudentExamQuestion(widget.examId));
        } else if (state is ExamReviewPageLoading) {
          return Container(
              height: MediaQuery.of(context).size.height - 56,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(child: LoadingAnimation()));
        } else if (state is ExamReviewPageLoaded) {
          return state.list.length == 0
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.grey[900],
                  child: Text("لا يوجد اسئلة"),
                )
              : examQuestionLoadedBody(state.list[0], state.baseUrl);
        } else if (state is ExamReviewPageError) {
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[900],
            child: Text("فشل في الاتصال"),
          );
        }
        return LoadingAnimation();
      },
    );
  }

  Padding examQuestionLoadedBody(
      ExamQuestionReviewModel question, String baseUrl) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (question.prevQ != "") {
                    BlocProvider.of<ExamReviewPageBloc>(context).add(
                        PreviousExamQuestion(
                            widget.examId, int.parse(question.prevQ)));
                  }
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: question.prevQ == ""
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
                " السؤال رقم ${question.rowNo}",
                style: AppThemeData()
                    .tajwalText
                    .copyWith(color: Colors.white, fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  if (question.nextQ != "") {
                    BlocProvider.of<ExamReviewPageBloc>(context).add(
                        NextExamQuestion(
                            widget.examId, int.parse(question.nextQ)));
                  }
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: question.nextQ == ""
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: Center(
                    child: Text(
                      question.textAnswerGrade == ""
                          ? "${question.questionGrade} علامات"
                          : "لقد حصلت على ${question.textAnswerGrade} من أصل ${question.questionGrade} علامات",
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),

          question.qPhoto == null
              ? Container()
              : CachedNetworkImage(
                  imageUrl: "http://${baseUrl}/${question.qPhoto}",
                  placeholder: (context, url) =>
                      new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),

          //if
          answerWidget(question),
          question.rightAnswer == null
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
                      question.questionDesc,
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
          theAnswers(question),
          SizedBox(
            height: 20,
          ),
          moveToNextQuestionButton(question),
        ],
      ),
    );
  }

  Widget theAnswers(ExamQuestionReviewModel question) {
    if (question.questionType == "1") {
      //change the value of the multiChoiceQuestionAnswer variable
      multiChoiceQuestionAnswer = question.studentAnswerText;
      //multiple choice question
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppThemeData().thirdColor),
          child: Column(
            children: [
              SizedBox(height: 20),
              multiChoiceQuestionAnswerWidget(
                  question.answer1, multiChoiceQuestionAnswer),
              multiChoiceQuestionAnswerWidget(
                  question.answer2, multiChoiceQuestionAnswer),
              multiChoiceQuestionAnswerWidget(
                  question.answer3, multiChoiceQuestionAnswer),
              multiChoiceQuestionAnswerWidget(
                  question.answer4, multiChoiceQuestionAnswer),
              multiChoiceQuestionAnswerWidget(
                  question.answer5, multiChoiceQuestionAnswer),
              SizedBox(height: 20),
            ],
          ),
        ),
      );
    } else if (question.questionType == "2") {
      //change the value of the multiChoiceQuestionAnswer variable
      trueFalseQuestionAnswer = question.studentAnswerText;
      return trueFalseQuestionAnswerWidget(question);
    } else if (question.questionType == "3") {
      return textWritingQuestionAnswerWidget(question);
    }
    return Container();
  }

  Container trueFalseQuestionAnswerWidget(ExamQuestionReviewModel question) {
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

  Widget textWritingQuestionAnswerWidget(ExamQuestionReviewModel question) {
    return Column(
      children: [
        Form(
          key: _formKey3,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              maxLines: 30,
              minLines: 15,
              readOnly: true,
              initialValue:
                  question.textAnswer == null ? "" : question.textAnswer,
              decoration:
                  inputdecoration("اجابة الطالب", "${question.textAnswer}"),
              // validator: (val) {
              //   if (val.isEmpty) {
              //     return "الرجاء ادخال رسالة ";
              //   } else
              //     return null;
              // },
              onChanged: (String val) {},
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppThemeData().thirdColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      "ملاحظات المعلم",
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      question.teacherRemarks == null
                          ? ""
                          : question.teacherRemarks,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              fileRow(question.fileUrl),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
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
                // setState(() {
                //   multiChoiceQuestionAnswer = value;
                // });
              },
            ),
          );
  }

  Widget moveToNextQuestionButton(ExamQuestionReviewModel question) {
    return GestureDetector(
      onTap: () {
        if (question.nextQ == "") {
          //we are on the last question pop view
          Navigator.pop(context);
        } else {
          // there is still question left go to next quesion
          BlocProvider.of<ExamReviewPageBloc>(context)
              .add(NextExamQuestion(widget.examId, int.parse(question.nextQ)));
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
                  : "الانتقال للسؤال التالي",
              textAlign: TextAlign.center,
              style: AppThemeData()
                  .tajwalText
                  .copyWith(color: Colors.white, fontSize: 16),
            ),
          ))),
    );
  }

  Container answerWidget(ExamQuestionReviewModel question) {
    return question.rightAnswer == null
        ? Container()
        : Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppThemeData().thirdColor),
            child: Column(
              children: [
                Container(
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 15, bottom: 15),
                          child: Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  question.rightAnswer == null
                                      ? ""
                                      : question.rightAnswerText,
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: AppThemeData().tajwalText.copyWith(
                                      color: Colors.white, fontSize: 16),
                                )),
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20, top: 20),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "الأجابة النموذجية",
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: AppThemeData()
                                  .tajwalText
                                  .copyWith(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10)),
                            color: question.isRightAnswer == "Y"
                                ? Colors.green[200]
                                : Colors.red[300],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, bottom: 15, top: 15),
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  question.studentAnswerText == null
                                      ? ""
                                      : question.studentAnswerText,
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: AppThemeData().tajwalText.copyWith(
                                      color: Colors.white, fontSize: 16),
                                )),
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20, top: 15),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "اجابة الطالب",
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: AppThemeData()
                                  .tajwalText
                                  .copyWith(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Widget fileRow(String name) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.check,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                //TODO :: change this to dynamic url
                launch('http://portal.gtseries.net/uploads/${name}');
              },
              child: Text(
                name,
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.clip,
              ),
            ),
          )
        ],
      ),
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
}
