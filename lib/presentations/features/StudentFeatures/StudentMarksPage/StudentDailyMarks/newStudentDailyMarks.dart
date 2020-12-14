import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_daily_marks_entity.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentMarksPage/StudentDailyMarks/bloc/daily_marks_bloc.dart';

class NewStudentDailyMarks extends StatefulWidget {
  @override
  _NewStudentDailyMarksState createState() => _NewStudentDailyMarksState();
}

class _NewStudentDailyMarksState extends State<NewStudentDailyMarks> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyMarksBloc, DailyMarksState>(
      builder: (context, state) {
        if (state is StudentDailyMarksEmpty) {
          BlocProvider.of<DailyMarksBloc>(context)
              .add(FetchStudentDailyMarks());
        }
        if (state is StudentDailyMarksLoaded) {
          return Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: state.dailyMarksList.length,
                  itemBuilder: (context, index) {
                    return dailyMarksTile(state.dailyMarksList[index]);
                  }));
        }
        if (state is StudentDailyMarksError) {
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[900],
            child: Text("فشل في الاتصال"),
          );
        }
        return Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: SpinKitFadingCube(
                color: AppThemeData().primaryColor,
                size: 80.0,
              ),
            ));
      },
    );
  }

  Column dailyMarksTile(DailyMarksEntity list) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                  title: FittedBox(
                    alignment: Alignment.centerRight,
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "${list.subjectDesc}",
                            style: AppThemeData()
                                .tajwalText
                                .copyWith(color: Colors.white, fontSize: 16),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text(
                            "${list.date}",
                            style: AppThemeData()
                                .tajwalText
                                .copyWith(color: Colors.white, fontSize: 14),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Text(
                    "${list.examDesc}",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.black, fontSize: 14),
                    textDirection: TextDirection.rtl,
                  ),
                  expandedAlignment: Alignment.centerRight,
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "العلامة",
                            style: AppThemeData()
                                .tajwalText
                                .copyWith(color: Colors.white, fontSize: 16),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        Container(
                          child: Text(
                            "${list.grade} من ${list.maxGrade}",
                            style: AppThemeData()
                                .tajwalText
                                .copyWith(color: Colors.black, fontSize: 16),
                            textDirection: TextDirection.rtl,
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
        ),
      ],
    );
  }
}
