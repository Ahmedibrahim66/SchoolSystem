import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/navigationDrawer.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentMarksPage/StudentDailyMarks/bloc/daily_marks_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentMarksPage/StudentDailyMarks/newStudentDailyMarks.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentMarksPage/bloc/studentmarks_bloc.dart';

class NewStudentMarksPage extends StatefulWidget {
  @override
  _NewStudentMarksPageState createState() => _NewStudentMarksPageState();
}

class _NewStudentMarksPageState extends State<NewStudentMarksPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentmarksBloc, StudentmarksState>(
        builder: (context, state) {
      changeStatusBarColor();
      return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  BlocProvider.of<DailyMarksBloc>(context)
                      .add(FetchStudentDailyMarks());

                  BlocProvider.of<StudentmarksBloc>(context)
                      .add(NavigateToStudentDailyMarks());
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
                      flex: 2,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(70)),
                          color: AppThemeData().primaryColor,
                        ),
                        child: upperBody(state),
                      )),
                  Expanded(
                    flex: 3,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(70)),
                        color: Colors.white,
                      ),
                      child: lowerBody(state),
                    ),
                  )
                ],
              )
            ],
          ));
    });
  }

  Widget upperBody(StudentmarksState state) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: SvgPicture.asset(
                "assets/StudentMarksPageAssets/exams.svg",
                width: MediaQuery.of(context).size.width / 2.5,
              )),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<StudentmarksBloc>(context)
                          .add(NavigateToStudentQuarterMarks());
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: state is StudentQuarterMarksState
                            ? AppThemeData().thirdColor
                            : AppThemeData().primaryColor,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Center(
                        child: Container(
                          width: 40,
                          child: SvgPicture.asset(
                              "assets/StudentMarksPageAssets/calendar.svg" , width: 40,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      child: FittedBox(
                          child: Text(
                        "العلامات الفصلية",
                        style: AppThemeData()
                            .tajwalText
                            .copyWith(color: Colors.white),
                      ))),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<StudentmarksBloc>(context)
                          .add(NavigateToStudentDailyMarks());
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: state is StudentDailyMarksState
                            ? AppThemeData().thirdColor
                            : AppThemeData().primaryColor,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Center(
                        child: Container(
                          width: 40,
                          child: SvgPicture.asset(
                              "assets/StudentMarksPageAssets/monday.svg" , width: 40,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      child: FittedBox(
                          child: Text(
                        "العلامات اليومية",
                        style: AppThemeData()
                            .tajwalText
                            .copyWith(color: Colors.white),
                      ))),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget lowerBody(StudentmarksState state) {
    if (state is StudentDailyMarksState) {
      return Container(width: 400, child: NewStudentDailyMarks());
    }

    if (state is StudentQuarterMarksState) {
      return Container();
    }

    return Container();
  }

  changeStatusBarColor() {
    FlutterStatusbarcolor.setStatusBarColor(AppThemeData().primaryColor);
  }
}
