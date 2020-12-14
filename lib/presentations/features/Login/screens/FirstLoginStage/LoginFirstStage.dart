import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustafa0_1/Domain/repositories/authenticationRepository.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/Login/screens/FirstLoginStage/bloc/login_first_stage_bloc.dart';

/// this is the second login screen where the user will select which
/// type he is which then will navigate him to the login screen

class FirstLoginScreen extends StatefulWidget {
  final AuthenticationRepository repository;
  FirstLoginScreen({this.repository});
  @override
  _FirstLoginScreenState createState() => _FirstLoginScreenState();
}

class _FirstLoginScreenState extends State<FirstLoginScreen> {
  @override
  Widget build(BuildContext context) {
    changeStatusBarColor();
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: AppThemeData().primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: AppThemeData().primaryColor,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () {
                           
                            BlocProvider.of<LoginFirstStageBloc>(context)
                                .add(ChooseParentType());
                               
                           
                          },
                          child: Container(
                            color: AppThemeData().primaryColor,
                            child: category("assets/LoginPageAssets/parent.svg",
                                "ولي أمر", Colors.white),
                          ),
                        );
                      }),
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<LoginFirstStageBloc>(context)
                            .add(ChooseStudentType());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(70)),
                            color: Colors.white),
                        child: category("assets/LoginPageAssets/loginAsset.svg",
                            "طالب", AppThemeData().primaryColor),
                      ),
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<LoginFirstStageBloc>(context)
                              .add(ChooseTeacherType());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(70)),
                              color: Colors.white),
                          child: category("assets/LoginPageAssets/teacher.svg",
                              "معلم", AppThemeData().primaryColor),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<LoginFirstStageBloc>(context)
                              .add(ChooseManagemntType());
                        },
                        child: Container(
                          color: AppThemeData().primaryColor,
                          child: category(
                              "assets/LoginPageAssets/managment.svg",
                              "الادارة",
                              Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget category(String asset, String title, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: "Hero",
                  child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SvgPicture.asset(
                asset,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          title,
          style: AppThemeData().tajwalText.copyWith(color: color, fontSize: 25),
        ),
      ],
    );
  }

  changeStatusBarColor() {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
  }
}
