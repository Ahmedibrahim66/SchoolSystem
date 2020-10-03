import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentMarksPage/StudentDailyMarks/bloc/daily_marks_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentMarksPage/StudentDailyMarks/student_daily_marks.dart';

class StudentMarks extends StatefulWidget {
  @override
  _StudentMarksState createState() => _StudentMarksState();
}

class _StudentMarksState extends State<StudentMarks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        title: Text(
          'علامات الطالب',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lemonada'),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 45,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.3),
                      blurRadius: 40,
                      offset: Offset(0, 10))
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset(
                    'assets/maleStudent.png',
                    width: 150,
                    height: 150,
                  ),
                  Image.asset(
                    'assets/femaleStudent.png',
                    width: 150,
                    height: 150,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    color: Color(0xffF06A3F),
                    height: 70,
                    child: Center(
                      child: FlatButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return BlocProvider.value(
                                value: BlocProvider.of<DailyMarksBloc>(context),
                                child: StudentDailyMarks(),
                              );
                            }));
                          },
                          child: Text(
                            'علامات التقييمات اليومية',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lemonada',
                                fontSize: 18,
                                color: Colors.white),
                          )),
                    ),
                  ),
                  Container(
                    color: Color(0xff8BC34A),
                    height: 70,
                    child: Center(
                      child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'العلامات الفصلية',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lemonada',
                                fontSize: 18,
                                color: Colors.white),
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
