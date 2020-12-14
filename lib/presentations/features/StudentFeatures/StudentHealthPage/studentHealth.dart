import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_health_entity.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentHealthPage/bloc/student_health_bloc.dart';


class NewStudentHealth extends StatefulWidget {
  @override
  _NewStudentHealthState createState() => _NewStudentHealthState();
}

class _NewStudentHealthState extends State<NewStudentHealth> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentHealthBloc, StudentHealthState>(
        builder: (context, state) {
      if (state is StudentHealthEmpty) {
        BlocProvider.of<StudentHealthBloc>(context).add(FetchStudentHealth());
      }
      if (state is StudentHealthError) {
        changeStatusBarColor();
        return Container(child: Center(child: Text("فشل في الاتصال")));
      }

      if (state is StudentHealthLoaded) {
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

  Widget upperBody(StudentHealthLoaded state) {
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
                    "assets/StudentProfilePageAssets/health.svg")),
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 5,
                child: FittedBox(
                    child: Text(
                  "الملف الصحي",
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
                    return lateTile(state.list[index]);
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

 
  Column lateTile(StudentHealthEntity list) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppThemeData().thirdColor,
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: ExpansionTile(
                  leading: Container(
                      width: 30,
                      height: 40,
                      child: Center(
                          child: SvgPicture.asset(
                              "assets/StudentProfilePageAssets/stopwatch.svg"))),
                  childrenPadding: EdgeInsets.only(right: 70),
                  backgroundColor: AppThemeData().thirdColor,
                  title: Text(
                    "${list.healthDesc}",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(
                    "${list.hlActionDesc}",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.black, fontSize: 14),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                  ),
                  expandedAlignment: Alignment.centerRight,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            "السنة الدراسية",
                            style: AppThemeData()
                                .tajwalText
                                .copyWith(color: Colors.white, fontSize: 16),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        Container(
                          child: Text(
                            "${list.studYear}",
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
                            list.remarks == null
                                ? "لا يوجد"
                                : "${list.remarks}",
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  changeStatusBarColor() {
    FlutterStatusbarcolor.setStatusBarColor(AppThemeData().primaryColor);
  }
}
