import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustafa0_1/Domain/entities/student_learning_material.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/navigationDrawer.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentLearningMaterial/bloc/studentlearnnigmaterial_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentLearningMaterial extends StatefulWidget {
  @override
  _StudentLearningMaterial createState() => _StudentLearningMaterial();
}

class _StudentLearningMaterial extends State<StudentLearningMaterial> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentLearningMaterialBloc,
        StudentlearnnigmaterialState>(builder: (context, state) {
      changeStatusBarColor();
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                BlocProvider.of<StudentLearningMaterialBloc>(context)
                    .add(FetchStudentLearningMaterial());
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

  Widget body(StudentlearnnigmaterialState state) {
    if (state is StudentlearnnigmaterialEmpty) {
      BlocProvider.of<StudentLearningMaterialBloc>(context)
          .add(FetchStudentLearningMaterial());
    }
    if (state is StudentlearnnigmaterialLoaded) {
      return Container(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top -
              MediaQuery.of(context).padding.bottom,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              paymentBody(state),
            ],
          ));
    }
    if (state is StudentlearnnigmaterialError) {
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

  Widget paymentBody(StudentlearnnigmaterialLoaded state) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              child: FittedBox(
            child: SvgPicture.asset(
              "assets/StudentLearningMaterialAssets/learn.svg",
              width: MediaQuery.of(context).size.width / 2,
            ),
          )),
          SizedBox(
            height: 20,
          ),
          Container(
              width: MediaQuery.of(context).size.width / 3,
              child: FittedBox(
                  child: Text(
                "المواد التعليمية",
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
    );
  }

  noteItem(StudentLearningMaterialEntity list) {
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
                    "${list.subjectNo}",
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
                "${list.employeeNo}",
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
                        "${list.classNo} الشعبة ${list.sectionNo}",
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
                        "وصف المادة التعليمية",
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
                        "وصلات خارجية",
                        style: AppThemeData()
                            .tajwalText
                            .copyWith(color: Colors.white, fontSize: 16),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () => launch('https://flutter.dev'),
                        child: Text(
                          "${list.linkURL}",
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
                  ],
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
