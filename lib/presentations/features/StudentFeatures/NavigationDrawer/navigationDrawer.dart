import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/main.dart';
import 'package:mustafa0_1/presentations/features/Authentication/bloc/authentication_bloc.dart';
import 'package:mustafa0_1/presentations/features/ParentFeatures/NavigationDrawer/bloc/parentnavigation_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/bloc/studentnavigation_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentLearningMaterial/StudentLearningMaterial.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentNavigationDrawer extends StatelessWidget {
  const StudentNavigationDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      child: BlocBuilder<StudentnavigationBloc, StudentnavigationState>(
        builder: (context, state) {
          
          return Container(
            color: Colors.white,
            child: ListView(
              children: [
                Container(
                  color: AppThemeData().primaryColor,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(
                      "assets/StudentDashBoardAssets/bookRoad3.svg",
                    ),
                  ),
                ),
                Container(
                    color: AppThemeData().primaryColor,
                    child: Center(
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "مدرسة النجاح الثانوية للبنات",
                              style: AppThemeData()
                                  .tajwalText
                                  .copyWith(fontSize: 20, color: Colors.white),
                            )))),
                Container(
                  color: AppThemeData().primaryColor,
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                state.state == 0 ? Container() : drawerTile("اختار الأبن/ـة", () {
                   BlocProvider.of<ParentnavigationBloc>(context)
                            .add(ChangeChildrensEvent());
                }),
                state is StudentnavigationToHome
                    ? drawerTilePressed("الرئيسية")
                    : drawerTile("الرئيسية", () {
                        BlocProvider.of<StudentnavigationBloc>(context)
                            .add(NavigateToHomeScreen(context));
                      }),
                state is StudentProfileState
                    ? drawerTilePressed("ملف الطالب")
                    : drawerTile("ملف الطالب", () {
                        BlocProvider.of<StudentnavigationBloc>(context)
                            .add(NavigateToStudentProfile(context));
                      }),
                state is StudentMarksState
                    ? drawerTilePressed("العلامات")
                    : drawerTile("العلامات", () {
                        BlocProvider.of<StudentnavigationBloc>(context)
                            .add(NavigateToStudentGrades(context));
                      }),
                drawerTile("حلقات النقاش", () {}),
                drawerTile("الخطة الارشادية", () {}),
                drawerTile("الوظائف", () {}),
                 state is StudentsLearningMaterialState ? drawerTilePressed("المواد التعليمية") : drawerTile("المواد التعليمية", () {
                    BlocProvider.of<StudentnavigationBloc>(context)
                            .add(NavigateToStudentLeaningMaterial(context));
                }),
                drawerTile("مواعيد زيارة الاهل", () {}),
                state is StudentsPaymentState
                    ? drawerTilePressed("الاقساط")
                    : drawerTile("الاقساط", () {
                        BlocProvider.of<StudentnavigationBloc>(context)
                            .add(NavigateToStudentPayment(context));
                      }),
                drawerTile("الرسائل", () {}),
                drawerTile("تسجيل الخروج", () {
                  BlocProvider.of<StudentnavigationBloc>(context)
                      .add(LogoutEvent(context));
                }),
              ],
            ),
          );
        },
      ),
    );
  }

  RaisedButton drawerTilePressed(String title) {
    return RaisedButton(
      color: AppThemeData().thirdColor,
      elevation: 0,
      onPressed: () {},
      child: Container(
        height: 50,
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "$title",
            style: AppThemeData().tajwalText.copyWith(fontSize: 18),
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }

  RaisedButton drawerTile(String title, Function fun) {
    return RaisedButton(
      elevation: 0,
      color: Colors.white,
      onPressed: fun,
      child: Container(
        height: 50,
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "$title",
            style: AppThemeData().tajwalText.copyWith(fontSize: 16),
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}
