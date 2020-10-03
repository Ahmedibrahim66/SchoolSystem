import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentAttendence/bloc/student_attendence_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentAttendence/student_attendence_card.dart';
import 'package:mustafa0_1/presentations/widgets/LoadingAnimation.dart';

class StudentAbsent extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<StudentAttendenceBloc>(context)
                              .add(FetchStudentAbsence());
                        },
                        child: Icon(Icons.refresh)),
                  )
                ],
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        title: Text(
          'الغيابات',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
            color: Colors.white,
            fontFamily: 'Lemonada',
          ),
        ),
      ),
      body: BlocBuilder<StudentAttendenceBloc, StudentAttendenceState>(
        builder: (context, state) {
          if (state is StudentAbsenceEmpty) {
            BlocProvider.of<StudentAttendenceBloc>(context)
                .add(FetchStudentAbsence());
          }
          if (state is StudentAbsenceLoaded) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey[900],
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: state.list
                        .map((absent) => StudentAbsentAndLateCard(absent))
                        .toList(),
                  ),
                ),
              ),
            );
          }

          if (state is StudentAbsenceError) {
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
}
