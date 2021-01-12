import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_info_entity.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/navigationDrawer.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentAttendence/bloc/student_attendence_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentAttendence/newStudentAttencdence.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentBehaviour/bloc/student_behaviour_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentBehaviour/newStudentBehavior.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentHealthPage/bloc/student_health_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentHealthPage/studentHealth.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentLatePage/StudentLate.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentLatePage/bloc/studentlate_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentProfile/StudentIdCard.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentProfile/bloc/student_info_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentProfileNavigation/bloc/studentprofilenavigation_bloc.dart';

class NewStudentInfo extends StatefulWidget {
  @override
  _NewStudentInfoState createState() => _NewStudentInfoState();
}

class _NewStudentInfoState extends State<NewStudentInfo> {
  StudentInfoEntity studentInfo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentprofilenavigationBloc,
        StudentprofilenavigationState>(builder: (context, state) {
      changeStatusBarColor();
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                leading: GestureDetector(
                    onTap: () {
                      if (state is StudentProfileIDState)
                        BlocProvider.of<StudentInfoBloc>(context)
                            .add(FetchStudentInfo());

                      if (state is StudentProfileAbsenceState)
                        BlocProvider.of<StudentAttendenceBloc>(context)
                            .add(FetchStudentAbsence());

                      if (state is StudentProfileBehavoirState)
                        BlocProvider.of<StudentBehaviourBloc>(context)
                            .add(FetchStudentBehaviour());

                      if (state is StudentProfileLateState)
                        BlocProvider.of<StudentlateBloc>(context)
                            .add(FetchStudentLate());

                      if (state is StudentProfileHealthState)
                        BlocProvider.of<StudentHealthBloc>(context)
                            .add(FetchStudentHealth());
                    },
                    child: Icon(Icons.refresh)),
                elevation: 0,
                backgroundColor: AppThemeData().primaryColor,
                centerTitle: true,
                title: Text(
                  "GT Series",
                  style: AppThemeData()
                      .lexendDecaText
                      .copyWith(color: Colors.white),
                ),
              ),
              endDrawer: StudentNavigationDrawer(),
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: AppThemeData().primaryColor,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                          flex: 6,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(70)),
                              color: AppThemeData().primaryColor,
                            ),
                            child: upperBody(state),
                          )),
                      Container(
                        height: 100,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(70)),
                          color: Colors.white,
                        ),
                        child: lowerBody(),
                      )
                    ],
                  )
                ],
              )),
        ),
      );
    });
  }

  Widget upperBody(StudentprofilenavigationState state) {
    if (state is StudentProfileIDState) {
      return StudentIDCard();
    }
    if (state is StudentProfileAbsenceState) return NewStudentAttendence();

    if (state is StudentProfileBehavoirState) return NewStudentBehavoir();

    if (state is StudentProfileLateState) return NewStudentLate();

    if (state is StudentProfileHealthState) return NewStudentHealth();

    return Container();
  }

  Widget lowerBody() {
    return BlocBuilder<StudentprofilenavigationBloc,
        StudentprofilenavigationState>(
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<StudentprofilenavigationBloc>(context)
                              .add(NavigateToStudentBehavior());
                        },
                        child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: state is StudentProfileBehavoirState
                                    ? AppThemeData().thirdColor
                                    : Colors.white),
                            height: 35,
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "الملف السلوكي",
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: AppThemeData().tajwalText.copyWith(
                                      fontSize: 14,
                                      color:
                                          state is StudentProfileBehavoirState
                                              ? Colors.white
                                              : Colors.black),
                                ),
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<StudentprofilenavigationBloc>(context)
                              .add(NavigateToStudentAbsence());
                        },
                        child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: state is StudentProfileAbsenceState
                                    ? AppThemeData().thirdColor
                                    : Colors.white),
                            height: 35,
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "الغيابات",
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: AppThemeData().tajwalText.copyWith(
                                      fontSize: 14,
                                      color: state is StudentProfileAbsenceState
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<StudentprofilenavigationBloc>(context)
                              .add(NavigateToStudentProfileID());
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: state is StudentProfileIDState
                                  ? AppThemeData().thirdColor
                                  : Colors.white),
                          height: 35,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "البطاقة الشخصية",
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: AppThemeData().tajwalText.copyWith(
                                    fontSize: 14,
                                    color: state is StudentProfileIDState
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            BlocProvider.of<StudentprofilenavigationBloc>(
                                    context)
                                .add(NavigateToStudentHealth());
                          },
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: state is StudentProfileHealthState
                                      ? AppThemeData().thirdColor
                                      : Colors.white),
                              height: 35,
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "الملف الصحي",
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                    style: AppThemeData().tajwalText.copyWith(
                                        fontSize: 14,
                                        color:
                                            state is StudentProfileHealthState
                                                ? Colors.white
                                                : Colors.black),
                                  ),
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            BlocProvider.of<StudentprofilenavigationBloc>(
                                    context)
                                .add(NavigateToStudentLate());
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: state is StudentProfileLateState
                                    ? AppThemeData().thirdColor
                                    : Colors.white),
                            height: 35,
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "التأخيرات",
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: AppThemeData().tajwalText.copyWith(
                                      fontSize: 14,
                                      color: state is StudentProfileLateState
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  changeStatusBarColor() {
    FlutterStatusbarcolor.setStatusBarColor(AppThemeData().primaryColor);
  }
}
