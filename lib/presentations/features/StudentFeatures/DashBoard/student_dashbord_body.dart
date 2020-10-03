import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentAttendence/bloc/student_attendence_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentBehaviour/bloc/student_behaviour_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentMarksPage/StudentDailyMarks/bloc/daily_marks_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentMarksPage/student_marks.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentPayment/bloc/student_payment_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentPayment/student_payment.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentProfile/StudentProfile.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentProfile/bloc/student_info_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentSchedual/bloc/student_schedual_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentSchedual/student_schedual.dart';

class DashboardBody extends StatefulWidget {
  @override
  _DashboardBodyState createState() {
    return _DashboardBodyState();
  }
}

class _DashboardBodyState extends State<DashboardBody> {
  Widget verticalDashItem(IconData icon, String name, int color) {
    return GestureDetector(
      onTap: () {
        if (name == 'ملف الطالب') {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return BlocProvider.value(
              value: BlocProvider.of<StudentInfoBloc>(context),
              child: BlocProvider.value(
                  value: BlocProvider.of<StudentBehaviourBloc>(context),
                  child: BlocProvider.value(
                      value: BlocProvider.of<StudentAttendenceBloc>(context),
                      child: StudentProfile())),
            );
          })
              // MaterialPageRoute(
              //     builder: (context) => StudentProfile())

              );
        } else if (name == 'العلامات') {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
            return BlocProvider.value(
              value: BlocProvider.of<DailyMarksBloc>(context),
              child: StudentMarks(),
            );
          }));

        } else if (name == 'حلقات النقاش') {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => StudentDiscussionsWodget()));
        }else if (name == 'الأقساط') {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return BlocProvider.value(
              value: BlocProvider.of<StudentPaymentBloc>(context),
              child: StudentPayment(),
            );
          }));

        }
      },
      child: Material(
        color: Color(color),
        elevation: 10.0,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon,
                    size: 40,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget horizontalDashItem(IconData icon, String name, int color) {
    return GestureDetector(
      onTap: () {
        if (name == 'الرئيسية') {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return BlocProvider.value(
              value: BlocProvider.of<StudentSchedualBloc>(context),
              child: StudentSchedual(),
            );
          }));
        }
      },
      child: Material(
        color: Color(color),
        elevation: 10.0,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height - 52 - 30;
    return StaggeredGridView.count(
      physics: ScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      children: <Widget>[
        horizontalDashItem(Icons.dashboard, "الرئيسية", 0xff8782FF),
        verticalDashItem(
            Icons.supervised_user_circle, "ملف الطالب", 0xffF06A3F),
        verticalDashItem(Icons.question_answer, "حلقات النقاش", 0xffF9AA40),
        verticalDashItem(Icons.map, "الخطة الإرشادية", 0xff607D8B),
        verticalDashItem(Icons.school, "العلامات", 0xffFDC106),
        verticalDashItem(Icons.work, "الوظائف", 0xff8BC34A),
        verticalDashItem(Icons.library_books, "المواد التعليمية", 0xff9E9E9E),
        verticalDashItem(Icons.date_range, "مواعيد زيارة الأهل", 0xffEC5862),
        verticalDashItem(Icons.attach_money, "الأقساط", 0xffEE5135),
        horizontalDashItem(Icons.message, "الرسائل", 0xff72b2a7),
      ],
      staggeredTiles: [
        StaggeredTile.extent(3, height / 7),
        StaggeredTile.extent(1, height / 7),
        StaggeredTile.extent(2, height / 7),
        StaggeredTile.extent(2, height / 7),
        StaggeredTile.extent(1, height / 7),
        StaggeredTile.extent(1, height / 7),
        StaggeredTile.extent(2, height / 7),
        StaggeredTile.extent(2, height / 7),
        StaggeredTile.extent(1, height / 7),
        StaggeredTile.extent(3, height / 7)
      ],
    );
  }
}
