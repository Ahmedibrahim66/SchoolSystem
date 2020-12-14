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
import 'package:mustafa0_1/presentations/features/Authentication/bloc/authentication_bloc.dart';
import 'package:mustafa0_1/presentations/features/BlocCreator/parentBlocCreator.dart';
import 'package:mustafa0_1/presentations/features/BlocCreator/studentBlocCreator.dart';
import 'package:mustafa0_1/presentations/features/Login/screens/FirstLoginStage/LoginFirstStage.dart';
import 'package:mustafa0_1/presentations/features/Login/screens/FirstLoginStage/bloc/login_first_stage_bloc.dart';
import 'package:mustafa0_1/presentations/features/Login/screens/NewLoginFinalStage.dart';
import 'package:mustafa0_1/presentations/widgets/LoadingAnimation.dart';

class AuthenticationScreen extends StatefulWidget {
  final AuthenticationRepository repository;
  AuthenticationScreen({this.repository}) : assert(repository != null);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final StudentRepository studentRepo =
      new StudentRepositoryImp(StudentRemoteDataSource());

  final ParentRepository parentRepo =
      new ParentRepositoryImp(ParentRemoteDataSource());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is InitialState) {
        return LoadingAnimation();
      }
      if (state is Authenticating) {
        //Authenticating state get authentication from authentication bloc
        return Scaffold(
          backgroundColor: Colors.deepPurple[900],
          body: Center(
            child: SpinKitFadingCube(color: Colors.white, size: 80.0),
          ),
        );
      }
      if (state is AuthenticatedStudent) {
        //create all the blocs need for the student to save his state then navigate him to home
        return StudentBlocCreator(
          repository1: studentRepo,
        );
      }

      if (state is Unauthenticated) {
        //unauthenticated User go to login page
        //TODO: Try to make better navigation for these pages
        return BlocBuilder<LoginFirstStageBloc, LoginFirstStageState>(
          builder: (context, state) {
            if (state is LoginFirstStageInitial)
              return FirstLoginScreen(
                repository: widget.repository,
              );
            return LoginFinalStage(
              authenticationRepository: widget.repository,
            );
          },
        );
      }

      if (state is AuthenticatedParent) {
        //create all the blocs need for the parent to save his state then navigate him to home
        return ParentBlocCreator(
          repository1: studentRepo,
          repository2: parentRepo,
        );
      }

      //deafult return value ** should never be reached**
      return Container(color: Colors.white);
    });
  }
}
