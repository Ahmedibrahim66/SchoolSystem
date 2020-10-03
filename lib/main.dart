import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/Data/DataSources/remoteData/authentication_remote_data_source.dart';
import 'package:mustafa0_1/Data/repositories/AuthenticationRepositoryImp.dart';
import 'package:mustafa0_1/Domain/repositories/authenticationRepository.dart';
import 'package:mustafa0_1/presentations/features/Authentication/authentication.dart';
import 'package:mustafa0_1/presentations/features/Authentication/bloc/authentication_bloc.dart';
import 'package:mustafa0_1/presentations/features/Login/screens/FirstLoginStage/LoginFirstStage.dart';
import 'package:mustafa0_1/presentations/features/Login/screens/FirstLoginStage/bloc/login_first_stage_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/DashBoard/bloc/student_dashboard_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocDelegate();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthenticationRepository repository =
      new AuthenticationRepositoryImp(AuthenticationRemoteDataSoruce());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => StudentDashboardBloc(),
            ),

            BlocProvider(create: (context) {
              //AuthenticationBloc();
              return AuthenticationBloc(repository: repository)
                ..add(AuthenticationStarted());
            }),

            BlocProvider(
              create: (context) => LoginFirstStageBloc(),
            ),

            // BlocProvider(
            //   create: (context) => AuthenticationBloc(repository: repository),
            // ),
          

          ], child: AuthenticationScreen(repository: repository,)),

    );
  }
}

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  // @override
  // void onError(Bloc bloc, Object error, StackTrace stackTrace) {
  //   print(error);
  //   super.onError(bloc, error, stackTrace);
  // }

  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }
}
