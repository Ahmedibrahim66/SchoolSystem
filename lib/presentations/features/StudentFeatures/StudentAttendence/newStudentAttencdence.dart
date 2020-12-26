import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_absence_entity.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentAttendence/bloc/student_attendence_bloc.dart';

class NewStudentAttendence extends StatefulWidget {
  @override
  _NewStudentAttendenceState createState() => _NewStudentAttendenceState();
}

class _NewStudentAttendenceState extends State<NewStudentAttendence> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentAttendenceBloc, StudentAttendenceState>(
        builder: (context, state) {
      if (state is StudentAbsenceEmpty) {
        BlocProvider.of<StudentAttendenceBloc>(context)
            .add(FetchStudentAbsence());
      }
      if (state is StudentAbsenceError) {
        changeStatusBarColor();
        return Container(child: Center(child: Text("فشل في الاتصال")));
      }

      if (state is StudentAbsenceLoaded) {
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

  Widget upperBody(StudentAbsenceLoaded state) {
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
                    "assets/StudentProfilePageAssets/asbsence.svg")),
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 5,
                child: FittedBox(
                    child: Text(
                  "الغيابات",
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

  Padding noteItem(StudentAbsenceEntity list) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
                        "${list.absenceDate}",
                        textAlign: TextAlign.right,
                        style: AppThemeData()
                            .tajwalText
                            .copyWith(color: Colors.black, fontSize: 16),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "العذر",
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.white, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                    Container(
                      height: 30,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${list.absenceDesc}",
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
                        list.isAccepted == "Y" ? "موافق عليه" : "غير موافق عليه",
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
                      "ملاحظات",
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.white, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                    Container(
                      height: 50,
                      alignment: Alignment.centerRight,
                      child: Text(
                        list.remarks == null ? "لا يوجد" : "${list.remarks}",
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
                        "assets/StudentProfilePageAssets/stopwatch.svg"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  changeStatusBarColor() {
    FlutterStatusbarcolor.setStatusBarColor(AppThemeData().primaryColor);
  }
}
