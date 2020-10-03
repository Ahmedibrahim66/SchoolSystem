import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentAttendence/bloc/student_attendence_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentAttendence/student_attendence.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentBehaviour/bloc/student_behaviour_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentBehaviour/student_behavior.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentProfile/bloc/student_info_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentProfile/student_info.dart';

class StudentProfile extends StatefulWidget {
  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ملف الطالب',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
            color: Colors.white,
            fontFamily: 'Lemonada',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  height: 100,
                  child: new Directionality(
                      textDirection: TextDirection.rtl,
                      child: RaisedButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return BlocProvider.value(
                              value: BlocProvider.of<StudentInfoBloc>(context),
                              child: StudentIdCard(),
                            );
                          })

                              // MaterialPageRoute(
                              //     builder: (context) => StudentIdCard())

                              );
                        },
                        color: Color(0xff8782FF),
                        textColor: Colors.white,
                        icon: Icon(
                          Icons.perm_identity,
                          size: 30,
                          color: Colors.white,
                        ),
                        label: Text(
                          'البطاقة الشخصية',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lemonada'),
                        ),
                      )),
                )),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  height: 100,
                  child: new Directionality(
                      textDirection: TextDirection.rtl,
                      child: RaisedButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return BlocProvider.value(
                              value: BlocProvider.of<StudentAttendenceBloc>(
                                  context),
                              child: StudentAbsent(),
                            );
                          }));
                        },
                        color: Color(0xffF06A3F),
                        textColor: Colors.white,
                        icon: Icon(
                          MdiIcons.close,
                          size: 30,
                          color: Colors.white,
                        ),
                        label: Text(
                          'الغيابات',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lemonada'),
                        ),
                      )),
                )),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  height: 100,
                  child: new Directionality(
                      textDirection: TextDirection.rtl,
                      child: RaisedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/studentLateProfile');
                        },
                        color: Color(0xffFDC106),
                        textColor: Colors.white,
                        icon: Icon(
                          MdiIcons.clockOut,
                          size: 30,
                          color: Colors.white,
                        ),
                        label: Text(
                          'التأخيرات',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lemonada'),
                        ),
                      )),
                )),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  height: 100,
                  child: new Directionality(
                      textDirection: TextDirection.rtl,
                      child: RaisedButton.icon(
                        onPressed: () {
                          // print("test");
                          // StudentRepositoryImp repositoryImp = StudentRepositoryImp(StudentRemoteDataSource());
                          // repositoryImp.getStudentBehaviour("8469796b8c3f8f51553b431f6c4f743d", "20160010");

                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return BlocProvider.value(
                              value: BlocProvider.of<StudentBehaviourBloc>(
                                  context),
                              child: BehaviourProfile(),
                            );
                          }));
                        },
                        color: Color(0xff8BC34A),
                        textColor: Colors.white,
                        icon: Icon(
                          MdiIcons.policeBadge,
                          size: 30,
                          color: Colors.white,
                        ),
                        label: Text(
                          'الملف السلوكي',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lemonada'),
                        ),
                      )),
                )),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  height: 100,
                  child: new Directionality(
                      textDirection: TextDirection.rtl,
                      child: RaisedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/studentHealthProfile');
                        },
                        color: Color(0xff9E9E9E),
                        textColor: Colors.white,
                        icon: Icon(
                          MdiIcons.heartPulse,
                          size: 30,
                          color: Colors.white,
                        ),
                        label: Text(
                          'الملف الصحي',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lemonada'),
                        ),
                      )),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
