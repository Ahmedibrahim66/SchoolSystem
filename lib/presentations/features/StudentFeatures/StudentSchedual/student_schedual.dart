import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentSchedual/bloc/student_schedual_bloc.dart';
import 'package:mustafa0_1/presentations/widgets/OneDaySchedual.dart';

class StudentSchedual extends StatefulWidget {
  @override
  _StudentSchedualState createState() => _StudentSchedualState();
}

class _StudentSchedualState extends State<StudentSchedual> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
            resizeToAvoidBottomPadding: true,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.grey[850],
              title: Center(
                child: Text(
                  'جدول الطالب الأسبوعي',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lemonada'),
                ),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<StudentSchedualBloc>(context)
                            .add(FetchStudentSchedual());
                      },
                      child: Icon(Icons.refresh)),
                )
              ],
            ),
            body:   BlocBuilder<StudentSchedualBloc, StudentSchedualState>(
      builder: (context, state) {
        if (state is StudentSchedualEmpty) {
          BlocProvider.of<StudentSchedualBloc>(context)
              .add(FetchStudentSchedual());
        }
        if (state is StudentSchedualLoading) {
          return loadingAnimation();
        }
        if (state is StudentSchedualLoaded) {
          return Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.grey[900],
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<StudentSchedualBloc>(context)
                                  .add(PrevoiusWeekSchedual());
                            },
                            child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  size: 40,
                                  color: Colors.white,
                                )),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                children: <Widget>[
                                  Text("من : ${state.daysOfWeek[0].date}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      )),
                                  Text("الى : ${state.daysOfWeek[6].date}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<StudentSchedualBloc>(context)
                                  .add(NextWeekSchedual());
                            },
                            child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 40,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.daysOfWeek.length,
                        itemBuilder: (context, index) {
                          if (state.schedule[index].isNotEmpty)
                            return OneDaySchedual(
                              homeworksAndExams: state.homeworksAndExams[index],
                              classes: state.schedule[index],
                              color: 0xff8782FF,
                              date: state.daysOfWeek[index].date,
                              day: state.daysOfWeek[index].dayDesc,
                            );

                          return Container();
                        },
                      ),
                    ],
                  ),
                ));
        
        }
        if (state is StudentSchedualEror) {
          return Container(child: Center(child: Text("فشل في الاتصال")));
        }

        return Container();
      },
    )
          );

   
  }

  Widget loadingAnimation() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey[850],
      child: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }

  
}
