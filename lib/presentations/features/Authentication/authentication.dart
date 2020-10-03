import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mustafa0_1/Data/DataSources/remoteData/ParentRemoteDataSoruce.dart';
import 'package:mustafa0_1/Data/DataSources/remoteData/studentRemoteDataSoruce.dart';
import 'package:mustafa0_1/Data/repositories/ParentRepositoryImp.dart';
import 'package:mustafa0_1/Data/repositories/StudentRepositoryImp.dart';
import 'package:mustafa0_1/Domain/repositories/authenticationRepository.dart';
import 'package:mustafa0_1/Domain/repositories/parentRepository.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:mustafa0_1/presentations/features/Login/screens/FinalStageLogin.dart';
import 'package:mustafa0_1/presentations/features/Authentication/bloc/authentication_bloc.dart';
import 'package:mustafa0_1/presentations/features/Login/screens/FirstLoginStage/LoginFirstStage.dart';
import 'package:mustafa0_1/presentations/features/Login/screens/FirstLoginStage/bloc/login_first_stage_bloc.dart';
import 'package:mustafa0_1/presentations/features/Login/screens/NewLoginFinalStage.dart';
import 'package:mustafa0_1/presentations/features/ParentFeatures/NavigationDrawer/bloc/parentnavigation_bloc.dart';
import 'package:mustafa0_1/presentations/features/ParentFeatures/NavigationDrawer/navigationHome.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/DashBoard/NewStudentDashboard.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/DashBoard/student_dashboard.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/bloc/studentnavigation_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/navigationHome.dart';
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
import 'package:mustafa0_1/presentations/widgets/LoadingAnimation.dart';

class AuthenticationScreen extends StatefulWidget {
  final AuthenticationRepository repository;
  AuthenticationScreen({this.repository}) : assert(repository != null);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final StudentRepository repository1 =
      new StudentRepositoryImp(StudentRemoteDataSource());

       final ParentRepository repository2 =
      new ParentRepositoryImp(ParentRemoteDataSource());


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is InitialState) {
        return LoadingAnimation();
        //BlocProvider.of<AuthenticationBloc>(context).add(AppStarted());
      }
      if (state is Authenticating) {
        // SchedulerBinding.instance.addPostFrameCallback((_) {
        //   Navigator.push(context, MaterialPageRoute(
        //     builder: (_) {
        //       return MultiBlocProvider(providers: [
        //         BlocProvider(
        //           create: (context) => StudentDashboardBloc(),
        //         ),
        //         BlocProvider(
        //           create: (context) => AuthenticationBloc(),
        //         ),
        //       ], child: LoadingAnimation());
        //     },
        //   ), );
        // });
        return Scaffold(
          backgroundColor: Colors.deepPurple[900],
          body: Center(
            child: SpinKitFadingCube(color: Colors.white, size: 80.0),
          ),
        );
      }
      if (state is AuthenticatedStudent) {
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
        ], child: NavigationHome());
        // return DashboardScaffold();
        // SchedulerBinding.instance.addPostFrameCallback((_) {

        //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        //     builder: (_) {
        //       return MultiBlocProvider(providers: [
        //         BlocProvider(
        //           create: (context) => StudentDashboardBloc(),
        //         ),
        //         BlocProvider(
        //           create: (context) => AuthenticationBloc(),
        //         ),
        //       ], child: DashboardScaffold());
        //     },
        //   ), (Route<dynamic> route) => false);
        // });
      }

      if (state is Unauthenticated) {
        return BlocBuilder<LoginFirstStageBloc, LoginFirstStageState>(
          builder: (context, state) {
            if (state is LoginFirstStageInitial) return FirstLoginScreen();
            return LoginFinalStage(
              authenticationRepository: widget.repository,
            );
          },
        );
        // return LoginFinalStage(
        //   authenticationRepository: widget.repository,
        // );
        // return FinalStageLogin(
        //   authenticationRepository: widget.repository,
        // );

        // SchedulerBinding.instance.addPostFrameCallback((_) {

        //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        //     builder: (_) {
        //       return BlocProvider.value(
        //         value: BlocProvider.of<AuthenticationBloc>(context),
        //         child: LoginPickType(),
        //       );
        //     },
        //   ), (Route<dynamic> route) => false);
        // });

        
      }

      if (state is AuthenticatedParent) {


        
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

      // if (state is AuthenticationError) {
      //   SchedulerBinding.instance.addPostFrameCallback((_) {
      //     showErrorMessage(context);
      //   });
      // }

      //default
      // return Scaffold(
      //   backgroundColor: Colors.deepPurple[900],
      //   body: Center(
      //     child: SpinKitFadingCube(color: Colors.white, size: 80.0),
      //   ),
      // );
      return Container();
    });
  }

  // Future showErrorMessage(BuildContext context) {
  //   return showModal(
  //     configuration: FadeScaleTransitionConfiguration(),
  //     context: context,
  //     builder: (BuildContext context) => CustomDialog(
  //       title: "فشل تسجيل الدخول",
  //       description: "تأكد من اسم المستخدم وكلمة المرور",
  //       buttonText: "حسنا",
  //     ),
  //   );
  // }
}
