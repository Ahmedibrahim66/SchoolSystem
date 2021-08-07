import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/ParentFeatures/NavigationDrawer/bloc/parentnavigation_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/bloc/studentnavigation_bloc.dart';

/// this class contains the navigation drawer widget UI in which the the buttons
/// will Navigate the user to diffrenet screen accordingly
/// important note if int state = 0 this means that the user is student
/// if the int state = 1 this means that the user is parent
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
                  height: MediaQuery.of(context).size.height / 3.8,
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

                // state is zero which means its a student (dont show choose child button)
                state.state == 0
                    ? Container()
                    : drawerTile("اختار الأبن/ـة", () {
                        BlocProvider.of<ParentnavigationBloc>(context)
                            .add(ChangeChildrensEvent());
                      }),

                // Home page is defualt for both users
                state is StudentnavigationToHome
                    ? drawerTilePressed("الرئيسية")
                    : drawerTile("الرئيسية", () {
                        BlocProvider.of<StudentnavigationBloc>(context)
                            .add(NavigateToHomeScreen(context));
                      }),

                // student profile page is defualt for both users
                state is StudentProfileState
                    ? drawerTilePressed("ملف الطالب")
                    : drawerTile("ملف الطالب", () {
                        BlocProvider.of<StudentnavigationBloc>(context)
                            .add(NavigateToStudentProfile(context));
                      }),

                // student marks page is defualt for both users
                state is StudentMarksState
                    ? drawerTilePressed("العلامات")
                    : drawerTile("العلامات", () {
                        BlocProvider.of<StudentnavigationBloc>(context)
                            .add(NavigateToStudentGrades(context));
                      }),

                // disscussion page is only for the student (dont show for parent) state = 0
                state.state == 0
                    ? state is StudentsDiscussionState
                        ? drawerTilePressed("حلقات النقاش")
                        : drawerTile("حلقات النقاش", () {
                            BlocProvider.of<StudentnavigationBloc>(context)
                                .add(NavigateToStudentDiscussion(context));
                          })
                    : Container(),

                // exams page is only for the student (dont show for parent) state = 0
                state.state == 0
                    ? state is StudentsExamState
                        ? drawerTilePressed("الأمتحانات")
                        : drawerTile("الأمتحانات", () {
                            BlocProvider.of<StudentnavigationBloc>(context)
                                .add(NavigateToStudentExams(context));
                          })
                    : Container(),

                // homeworks page is for both users
                state is StudentsHomeWorkMaterialState
                    ? drawerTilePressed("الوظائف")
                    : drawerTile("الوظائف", () {
                        BlocProvider.of<StudentnavigationBloc>(context)
                            .add(NavigateToStudentHomeWorkMaterial(context));
                      }),

                // learning material page is for both users
                state is StudentsLearningMaterialState
                    ? drawerTilePressed("المواد التعليمية")
                    : drawerTile("المواد التعليمية", () {
                        BlocProvider.of<StudentnavigationBloc>(context)
                            .add(NavigateToStudentLeaningMaterial(context));
                      }),

                // parent visit page is for both users
                //TODO : Create parent visit page
                drawerTile("مواعيد زيارة الاهل", () {}),

                // payments page is for both users
                state is StudentsPaymentState
                    ? drawerTilePressed("الاقساط")
                    : drawerTile("الاقساط", () {
                        BlocProvider.of<StudentnavigationBloc>(context)
                            .add(NavigateToStudentPayment(context));
                      }),

                // messaging page is for both users
                state is StudentsMessagesState
                    ? drawerTilePressed("الرسائل")
                    : drawerTile("الرسائل", () {
                        BlocProvider.of<StudentnavigationBloc>(context)
                            .add(NavigateToStudentMessages(context));
                      }),

                // logout button is for both users
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
