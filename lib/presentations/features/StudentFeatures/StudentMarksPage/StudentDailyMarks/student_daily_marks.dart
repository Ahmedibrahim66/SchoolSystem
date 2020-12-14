import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_daily_marks_entity.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentMarksPage/StudentDailyMarks/bloc/daily_marks_bloc.dart';
import 'package:mustafa0_1/presentations/widgets/LoadingAnimation.dart';

class StudentDailyMarks extends StatefulWidget {
  @override
  _StudentDailyMarksState createState() => _StudentDailyMarksState();
}

class _StudentDailyMarksState extends State<StudentDailyMarks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
                onTap: () {
                  BlocProvider.of<DailyMarksBloc>(context)
                      .add(FetchStudentDailyMarks());
                },
                child: Icon(Icons.refresh)),
          )
        ],
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        title: Text(
          'علامات التقييمات اليومية',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lemonada'),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: BlocBuilder<DailyMarksBloc, DailyMarksState>(
        builder: (context, state) {
          if (state is StudentDailyMarksEmpty) {
            BlocProvider.of<DailyMarksBloc>(context)
                .add(FetchStudentDailyMarks());
          }

          if (state is StudentDailyMarksLoaded) {
            return Container(
              padding: EdgeInsets.all(5.0),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return markCard(state.dailyMarksList[index]);
                },
                itemCount: state.dailyMarksList.length,
              ),
            );
          }

          if (state is StudentDailyMarksError) {
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey[900],
              child: Text("فشل في الاتصال"),
            );
          }
          return LoadingAnimation();
        },
      ),
    );
  }

  Widget markCard(DailyMarksEntity dailyMarks) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ExpansionCard(
        title: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white12,
                  child: Center(
                    child: Text(
                      dailyMarks.examNo.toString(),
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Lemonada',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.grey[850],
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      color: Colors.white70.withOpacity(0.2),
                                      width: 1.0))),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'الموضوع',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Lemonada',
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                dailyMarks.examDesc == null ? "لا يوجد موضوع" : dailyMarks.examDesc ,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Lemonada',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                dailyMarks.date,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Lemonada',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'العلامة',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lemonada',
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                dailyMarks.grade.toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Lemonada',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'البيان',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Lemonada',
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    dailyMarks.remarks == null ? "لا يوجد" : dailyMarks.remarks,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Lemonada',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'العلامة القصوى',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Lemonada',
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    dailyMarks.maxGrade.toString(),
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Lemonada',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'معدل الصف',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Lemonada',
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "لا يوجد",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Lemonada',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
