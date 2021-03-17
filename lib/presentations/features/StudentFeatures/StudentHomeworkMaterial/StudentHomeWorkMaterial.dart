import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentHomeworkMaterialModel.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/navigationDrawer.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentHomeWrokSubmissions/StudentHomeworkSubmissions.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentHomeWrokSubmissions/bloc/view_submission_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentHomeworkMaterial/bloc/student_homework_material_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/UploadFilePage/bloc/upload_file_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/UploadFilePage/uploadFilePage.dart';

import 'package:url_launcher/url_launcher.dart';

class StudentHomeworkMaterial extends StatefulWidget {
  @override
  _StudentHomeworkMaterialState createState() =>
      _StudentHomeworkMaterialState();
}

class _StudentHomeworkMaterialState extends State<StudentHomeworkMaterial> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<StudentHomeworkMaterialBloc,
        StudentHomeworkMaterialState>(
      listener: (context, state) {},
      child: BlocBuilder<StudentHomeworkMaterialBloc,
          StudentHomeworkMaterialState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  BlocProvider.of<StudentHomeworkMaterialBloc>(context)
                      .add(FetchStudentHomeworkMaterial());
                },
                child: Icon(Icons.refresh)),
            elevation: 0,
            backgroundColor: AppThemeData().primaryColor,
            centerTitle: true,
            title: Text(
              "GT Series",
              style:
                  AppThemeData().lexendDecaText.copyWith(color: Colors.white),
            ),
          ),
          endDrawer: StudentNavigationDrawer(),
          backgroundColor: AppThemeData().primaryColor,
          body: body(state),
        );
      }),
    );
  }

  Widget body(StudentHomeworkMaterialState state) {
    if (state is StudentHomeworkMaterialInitial) {
      BlocProvider.of<StudentHomeworkMaterialBloc>(context)
          .add(FetchStudentHomeworkMaterial());
    }

    if (state is StudentHomeworkMaterialError) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[900],
        child: Text("فشل في الاتصال"),
      );
    }
    if (state is StudentHomeworkMaterialLoading) {
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
    if (state is StudentHomeworkMaterialLoaded) {
      return Container(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top -
              MediaQuery.of(context).padding.bottom,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              learningMaterialBody(state),
            ],
          ));
    }
  }

  Widget learningMaterialBody(StudentHomeworkMaterialLoaded state) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              child: FittedBox(
            child: SvgPicture.asset(
              "assets/StudentMarksPageAssets/report-card.svg",
              width: MediaQuery.of(context).size.width / 4,
            ),
          )),
          SizedBox(
            height: 30,
          ),
          Container(
              width: MediaQuery.of(context).size.width / 4,
              child: FittedBox(
                  child: Text(
                "الوظائف",
                style: AppThemeData().tajwalText.copyWith(color: Colors.white),
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
    );
  }

  noteItem(StudentsHomeworkMaterialModel list) {
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
                          "assets/StudentMarksPageAssets/report-card.svg"))),
              childrenPadding: EdgeInsets.only(right: 70),
              backgroundColor: AppThemeData().thirdColor,
              title: Row(
                children: [
                  Text(
                    "${list.subjectDesc}",
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
              subtitle: Text(
                "${list.teacherName}",
                style: AppThemeData()
                    .tajwalText
                    .copyWith(color: Colors.black, fontSize: 14),
                textDirection: TextDirection.rtl,
              ),
              expandedAlignment: Alignment.centerRight,
              children: <Widget>[
                Column(
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
                        "${list.classDesc} الشعبة ${list.sectionSymbol}",
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
                        "وصف الوظيفة	",
                        style: AppThemeData()
                            .tajwalText
                            .copyWith(color: Colors.white, fontSize: 16),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Container(
                      child: Text(
                        "${list.materialDesc}",
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
                        "اخر موعد للتسليم",
                        style: AppThemeData()
                            .tajwalText
                            .copyWith(color: Colors.white, fontSize: 16),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Container(
                      child: Text(
                        "${list.handDate}",
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
                        "العلامة القصوى",
                        style: AppThemeData()
                            .tajwalText
                            .copyWith(color: Colors.white, fontSize: 16),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Container(
                      child: Text(
                        "${list.highMark}",
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
                        "علامة الطالب",
                        style: AppThemeData()
                            .tajwalText
                            .copyWith(color: Colors.white, fontSize: 16),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Container(
                      child: Text(
                        "${list.studentGrade}",
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
                        "وصلات خارجية",
                        style: AppThemeData()
                            .tajwalText
                            .copyWith(color: Colors.white, fontSize: 16),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          try {
                            launch('list.linkUrl');
                          } catch (e) {}
                        },
                        child: Text(
                          list.linkUrl == null
                              ? "لا يوجد وصلات خارجية"
                              : "${list.linkUrl}",
                          style: AppThemeData()
                              .tajwalText
                              .copyWith(color: Colors.black, fontSize: 16),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        "الملف المرفق",
                        style: AppThemeData()
                            .tajwalText
                            .copyWith(color: Colors.white, fontSize: 16),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          try {
                            launch(list.fileDesc);
                          } catch (e) {}
                        },
                        child: Text(
                          list.fileDesc == null
                              ? "لا يوجد ملف"
                              : "http://portal.gtseries.net/uploads/${list.filePath}",
                          style: AppThemeData()
                              .tajwalText
                              .copyWith(color: Colors.black, fontSize: 16),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        "تسليم الوظيفة",
                        style: AppThemeData()
                            .tajwalText
                            .copyWith(color: Colors.white, fontSize: 16),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    list.homeworkFileDesc == null
                        ? Text(
                            "لا يوجد تسليم",
                            style: AppThemeData()
                                .tajwalText
                                .copyWith(color: Colors.black, fontSize: 16),
                            textDirection: TextDirection.rtl,
                          )
                        : GestureDetector(
                            onTap: () {
                              //launch(list.filePath);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                          create: (context) =>
                                              ViewSubmissionBloc(),
                                          child:
                                              StudentHomeworkMaterialSubmssions(
                                            homeSeq: list.seq.toString(),
                                          ))));
                              // BlocProvider.of<StudentHomeworkMaterialBloc>(
                              //         context)
                              //     .add(ViewHomeworkSubmission(
                              //         list.seq.toString()));
                            },
                            child: Container(
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: AppThemeData().secondaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(child: Text("مشاهدة التسليم"))),
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    list.canUpload == "N"
                        ? Container()
                        : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                          create: (context) => UploadFileBloc(),
                                          child: UploadFilePageUI(
                                            homeworkSeq: list.seq,
                                          ))));
                            },
                            child: Container(
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: AppThemeData().secondaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(child: Text("رفع ملف")))),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
