import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustafa0_1/Domain/entities/student_behaviour_entity.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentBehaviour/bloc/student_behaviour_bloc.dart';

class NewStudentBehavoir extends StatefulWidget {
  @override
  _NewStudentBehavoirState createState() => _NewStudentBehavoirState();
}

class _NewStudentBehavoirState extends State<NewStudentBehavoir> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentBehaviourBloc, StudentBehaviourState>(
        builder: (context, state) {
      if (state is StudentBehaviourEmpty) {
        BlocProvider.of<StudentBehaviourBloc>(context)
            .add(FetchStudentBehaviour());
      }

      if (state is StudentBehaviourError) {
        changeStatusBarColor();
        return Container(child: Center(child: Text("فشل في الاتصال")));
      }

      if (state is StudentBehaviourLoaded) {
        changeStatusBarColor();
        return upperBody(state);
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
    });
  }

  Widget upperBody(StudentBehaviourLoaded state) {
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
                    "assets/StudentProfilePageAssets/teacher.svg")),
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 3,
                child: FittedBox(
                    child: Text(
                  "الملف السلوكي",
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
                  itemCount: state.studentBehaviourEntity.length,
                  itemBuilder: (context, index) {
                    return noteItem(state.studentBehaviourEntity[index]);
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

  Container noteItem(StudentBehaviourEntity list) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppThemeData().thirdColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "رقم الطالب",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${list.studentNo}",
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.black, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "التاريخ",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${list.behDate}",
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.black, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "البيان",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      list.alertDesc,
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.black, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "المدخل",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      list.behDesc,
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.black, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "الملاحظات",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.centerRight,
                    child: Text(
                      list.remarks,
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.black, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "الإجراء",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      list.procDesc,
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.black, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "الفصل",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      list.semester,
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.black, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "النقاط",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      list.points,
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.black, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 50,
                  height: 40,
                  child: SvgPicture.asset(
                      "assets/StudentProfilePageAssets/assessment.svg"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  changeStatusBarColor() {
    FlutterStatusbarcolor.setStatusBarColor(AppThemeData().primaryColor);
  }
}
