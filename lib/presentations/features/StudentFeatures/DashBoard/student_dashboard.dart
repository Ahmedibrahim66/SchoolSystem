import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mustafa0_1/Data/DataSources/remoteData/studentRemoteDataSoruce.dart';
import 'package:mustafa0_1/Data/repositories/StudentRepositoryImp.dart';
import 'package:mustafa0_1/presentations/features/Authentication/bloc/authentication_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/DashBoard/bloc/student_dashboard_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/DashBoard/student_dashbord_body.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentAttendence/bloc/student_attendence_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentBehaviour/bloc/student_behaviour_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentMarksPage/StudentDailyMarks/bloc/daily_marks_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentPayment/bloc/student_payment_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentProfile/bloc/student_info_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentSchedual/bloc/student_schedual_bloc.dart';

class DashboardScaffold extends StatefulWidget {
  @override
  _DashboardScaffoldState createState() => _DashboardScaffoldState();
}

class _DashboardScaffoldState extends State<DashboardScaffold> {
  final StudentRepositoryImp repository =
      new StudentRepositoryImp(StudentRemoteDataSource());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentDashboardBloc, StudentDashboardState>(
      builder: (context, state) {
        if (state is StudentDashboardInitial) {
          return Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.grey[850],
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'GT Series',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lemonada'),
                ),
              ),
              actions: <Widget>[
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () async {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(AuthenticationLoggedOut());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            MdiIcons.logout,
                            size: 25,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'تسجيل خروج',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: Container(
              child: MultiBlocProvider(providers: [
                BlocProvider(
                  create: (context) => StudentInfoBloc(repository),
                ),
                BlocProvider(
                  create: (context) => StudentSchedualBloc(repository),
                ),
                BlocProvider(
                  create: (context) => StudentBehaviourBloc(repository),
                ),
                BlocProvider(
                  create: (context) => StudentAttendenceBloc(repository),
                ),
                 BlocProvider(
                  create: (context) => StudentPaymentBloc(repository),
                ),
                 BlocProvider(
                  create: (context) => DailyMarksBloc(repository: repository),
                ),

              ], child: DashboardBody()),
              color: Colors.grey[900],
              width: double.infinity,
              height: double.infinity,
            ),
          );
        }

        return Scaffold(
          body: Container(
            child: Center(
              child: Text("Logged out error"),
            ),
          ),
        );
      },
    );
  }
}
