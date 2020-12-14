import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/Domain/repositories/parentRepository.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:mustafa0_1/presentations/features/ParentFeatures/NavigationDrawer/bloc/parentnavigation_bloc.dart';
import 'package:mustafa0_1/presentations/features/ParentFeatures/NavigationDrawer/navigationHome.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/bloc/studentnavigation_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentAttendence/bloc/student_attendence_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentBehaviour/bloc/student_behaviour_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentHealthPage/bloc/student_health_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentLatePage/bloc/studentlate_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentLearningMaterial/bloc/studentlearnnigmaterial_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentMarksPage/StudentDailyMarks/bloc/daily_marks_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentMarksPage/bloc/studentmarks_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentPayment/bloc/student_payment_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentProfile/bloc/student_info_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentProfileNavigation/bloc/studentprofilenavigation_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentSchedual/bloc/student_schedual_bloc.dart';


class ParentBlocCreator extends StatelessWidget {

  final StudentRepository repository1;
  final ParentRepository repository2;

  const ParentBlocCreator({Key key, this.repository1, this.repository2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => StudentSchedualBloc(repository1),
          ),
          BlocProvider(
            create: (context) => StudentnavigationBloc(),
          ),
          BlocProvider(
            create: (context) => StudentInfoBloc(repository1),
          ),
          BlocProvider(
            create: (context) => StudentAttendenceBloc(repository1),
          ),
          BlocProvider(
            create: (context) => StudentprofilenavigationBloc(),
          ),
          BlocProvider(
            create: (context) => StudentBehaviourBloc(repository1),
          ),
          BlocProvider(
            create: (context) => StudentPaymentBloc(repository1),
          ),
          BlocProvider(
            create: (context) => DailyMarksBloc(repository: repository1),
          ),
          BlocProvider(
            create: (context) => StudentmarksBloc(),
          ),
          BlocProvider(
            create: (context) => StudentLearningMaterialBloc(repository1),
          ),
          BlocProvider(
            create: (context) => StudentlateBloc(repository1),
          ),
          BlocProvider(
            create: (context) => StudentHealthBloc(repository1),
          ),
          BlocProvider(
            create: (context) => ParentnavigationBloc(repository2),
          ),
        ], child: ParentNavigationHome());
  }
}