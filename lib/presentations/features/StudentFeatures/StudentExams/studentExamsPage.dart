import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustafa0_1/Data/DataSources/remoteData/studentRemoteDataSoruce.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentExamModel.dart';
import 'package:mustafa0_1/Data/repositories/StudentRepositoryImp.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/navigationDrawer.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentExams/ExamReviewPage/ExamReview.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentExams/ExamReviewPage/bloc/exam_review_page_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentExams/bloc/studentexams_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentExams/examSubmissionPage/bloc/exam_submission_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentExams/examSubmissionPage/examSubmission.dart';

class StudentExamsPage extends StatefulWidget {
  @override
  _StudentExamsPageState createState() => _StudentExamsPageState();
}

class _StudentExamsPageState extends State<StudentExamsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentexamsBloc, StudentexamsState>(
        builder: (context, state) {
      changeStatusBarColor();
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                BlocProvider.of<StudentexamsBloc>(context)
                    .add(FetchStudentExams());
              },
              child: Icon(Icons.refresh)),
          elevation: 0,
          backgroundColor: AppThemeData().primaryColor,
          centerTitle: true,
          title: Text(
            "GT Series",
            style: AppThemeData().lexendDecaText.copyWith(color: Colors.white),
          ),
        ),
        endDrawer: StudentNavigationDrawer(),
        backgroundColor: AppThemeData().primaryColor,
        body: body(state),
      );
    });
  }

  Widget body(StudentexamsState state) {
    if (state is StudentExamsInitial) {
      BlocProvider.of<StudentexamsBloc>(context).add(FetchStudentExams());
    }
    if (state is StudentExamsLoaded) {
      return examsListBody(state);
    }
    if (state is StudentExamsError) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[900],
        child: Text("فشل في الاتصال"),
      );
    }

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 56,
        child: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 80.0,
          ),
        ));
  }

  Widget examsListBody(StudentExamsLoaded state) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 100,
                child: SvgPicture.asset(
                    "assets/StudentMarksPageAssets/exams.svg")),
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 4,
                child: FittedBox(
                    child: Text(
                  "الامتحانات",
                  style:
                      AppThemeData().tajwalText.copyWith(color: Colors.white),
                ))),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    return noteItem(state.list[index]);
                  }),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  noteItem(StudentExamModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppThemeData().thirdColor,
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: ExpansionTile(
              leading: Container(
                  width: 30,
                  height: 40,
                  child: Center(
                      child: SvgPicture.asset(
                          "assets/StudentLearningMaterialAssets/student.svg"))),
              childrenPadding: EdgeInsets.only(right: 70),
              backgroundColor: AppThemeData().thirdColor,
              title: Row(
                children: [
                  Text(
                    "${model.subjectDesc}",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${model.examDate}",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.black, fontSize: 14),
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    "${model.examDesc}",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.black, fontSize: 14),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
              expandedAlignment: Alignment.centerRight,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "الصف",
                          style: AppThemeData()
                              .tajwalText
                              .copyWith(color: Colors.white, fontSize: 16),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Container(
                        child: Text(
                          model.classDesc + "  " + model.sectionSymbol,
                          style: AppThemeData()
                              .tajwalText
                              .copyWith(color: Colors.black, fontSize: 16),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          "مدة الإمتحان بالدقائق",
                          style: AppThemeData()
                              .tajwalText
                              .copyWith(color: Colors.white, fontSize: 16),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Container(
                        child: Text(
                          model.examTimeInMin,
                          style: AppThemeData()
                              .tajwalText
                              .copyWith(color: Colors.black, fontSize: 16),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          "الوقت المتبقي بالدقائق",
                          style: AppThemeData()
                              .tajwalText
                              .copyWith(color: Colors.white, fontSize: 16),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Container(
                        child: Text(
                            model.canEnter == "Y"
                                ? "الإمتحان مفتوح"
                                : model.differance < 0
                                    ? "وقت الإمتحان إنتهى"
                                    : model.differance.toString(),
                            style: AppThemeData()
                                .tajwalText
                                .copyWith(color: Colors.black, fontSize: 14)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      model.maxGrade == null
                          ? Container()
                          : Container(
                              child: Text(
                                " العلامة القصوى",
                                style: AppThemeData().tajwalText.copyWith(
                                    color: Colors.white, fontSize: 16),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                      model.maxGrade == null
                          ? Container()
                          : Container(
                              child: Text(model.maxGrade,
                                  style: AppThemeData().tajwalText.copyWith(
                                      color: Colors.black, fontSize: 14)),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      model.studentGrade == null
                          ? Container()
                          : Container(
                              child: Text(
                                "علامة الطالب",
                                style: AppThemeData().tajwalText.copyWith(
                                    color: Colors.white, fontSize: 16),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                      model.studentGrade == null
                          ? Container()
                          : Container(
                              child: Text(model.studentGrade,
                                  style: AppThemeData().tajwalText.copyWith(
                                      color: Colors.black, fontSize: 14)),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      model.examGrade == null
                          ? Container()
                          : Container(
                              child: Text(
                                "العلامة القصوى",
                                style: AppThemeData().tajwalText.copyWith(
                                    color: Colors.white, fontSize: 16),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                      model.examGrade == null
                          ? Container()
                          : Container(
                              child: Text(model.examGrade,
                                  style: AppThemeData().tajwalText.copyWith(
                                      color: Colors.black, fontSize: 14)),
                            ),
                      SizedBox(
                        height: 20,
                      ),

                      /**
                     * If the exam did not start don't show the button
                     * if the exam started show eneter exam else show review exam
                    */
                      model.differance > 0
                          ? Container()
                          : ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              child: RaisedButton(
                                onPressed: () {
                                  if (model.canEnter == "N") {
                                    //exam is finished go to review exam
                                    final StudentRepository repository =
                                        new StudentRepositoryImp(
                                            StudentRemoteDataSource());

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BlocProvider(
                                            create: (context) =>
                                                ExamReviewPageBloc(repository),
                                            child: ExamReviewPage(
                                                examId: model.examSeq),
                                          ),
                                        ));
                                  } else if (model.canEnter == "Y") {
                                    //student can answer the exam go to exam

                                    final StudentRepository repository =
                                        new StudentRepositoryImp(
                                            StudentRemoteDataSource());

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BlocProvider(
                                            create: (context) =>
                                                ExamSubmissionBloc(repository),
                                            child: ExamSubmissionPage(
                                                examId: model.examSeq),
                                          ),
                                        ));
                                  }
                                },
                                color: Colors.green,
                                child: Text(
                                    model.canEnter == "N"
                                        ? "مراجعة الامتحان"
                                        : "الدخول لتقديم الامتحان",
                                    style: AppThemeData().tajwalText.copyWith(
                                        color: Colors.white, fontSize: 14)),
                              ),
                            ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  changeStatusBarColor() {
    FlutterStatusbarcolor.setStatusBarColor(AppThemeData().primaryColor);
  }
}
