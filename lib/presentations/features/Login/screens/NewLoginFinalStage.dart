import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustafa0_1/Domain/repositories/authenticationRepository.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/Authentication/bloc/authentication_bloc.dart';
import 'package:mustafa0_1/presentations/features/Login/bloc/login_bloc.dart';
import 'package:mustafa0_1/presentations/features/Login/screens/FirstLoginStage/bloc/login_first_stage_bloc.dart';
import 'package:mustafa0_1/presentations/widgets/dialogs/logInFailed.dart';

/// this class cotains the four login parts for the user
/// each part has his own navgiation and widget 


class LoginFinalStage extends StatefulWidget {
  final AuthenticationRepository authenticationRepository;

  const LoginFinalStage({Key key, this.authenticationRepository})
      : assert(authenticationRepository != null),
        super(key: key);

  @override
  _LoginFinalStageState createState() => _LoginFinalStageState();
}

final _formKey = GlobalKey<FormState>();
TextEditingController passwordController = TextEditingController();
TextEditingController userNameController = TextEditingController();
bool loading = false;
String logInType;

class _LoginFinalStageState extends State<LoginFinalStage> {
  @override
  Widget build(BuildContext context) {
    changeStatusBarColor();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: AppThemeData().primaryColor,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(70)),
                              color: Colors.white,
                            ),
                            child: upperBody(),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(70)),
                                color: AppThemeData().primaryColor,
                              ),
                              child: BlocProvider(
                                create: (context) => LoginBloc(
                                    authenticationBloc:
                                        BlocProvider.of<AuthenticationBloc>(
                                            context),
                                    authenticationRepositoryImp:
                                        widget.authenticationRepository),
                                child: lowerBody(),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  upperBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 56,
          width: double.infinity,
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<LoginFirstStageBloc>(context)
                    .add(ChooseBackToFirstScreen());
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: AppThemeData().primaryColor,
                size: 24,
              ),
            ),
          ),
        ),
        Expanded(
          child: Hero(
            tag: "Hero22",
            child: BlocBuilder<LoginFirstStageBloc, LoginFirstStageState>(
              builder: (context, state) {
                String asset;
                if (state is StudentTypeChoosen) {
                  logInType = "S";
                  asset = "assets/LoginPageAssets/loginAsset.svg";
                  return Container(
                    child: SvgPicture.asset(
                      asset,
                    ),
                  );
                }
                if (state is ParentTypeChoosen) {
                  logInType = "P";
                  asset = "assets/LoginPageAssets/parent.svg";
                  return Container(
                    child: SvgPicture.asset(
                      asset,
                    ),
                  );
                }
                if (state is TeacherTypeChoosen) {
                  logInType = "T";
                  asset = "assets/LoginPageAssets/teacher.svg";
                  return Container(
                    child: SvgPicture.asset(
                      asset,
                    ),
                  );
                }
                if (state is ManagmentTypeChoosen) {
                  asset = "assets/LoginPageAssets/managment.svg";
                  return Container(
                    child: SvgPicture.asset(
                      asset,
                    ),
                  );
                }

                return Container(
                  child: SvgPicture.asset(
                    asset,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "تسجيل الدخول",
              style: AppThemeData()
                  .tajwalText
                  .copyWith(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "مرحبا بعودتكم",
              style: AppThemeData().tajwalText.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        )
      ],
    );
  }

  lowerBody() {
    return Container(
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            showErrorMessage(context);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
                        controller: userNameController,
                        decoration:
                            inputdecoration("رقم المستخدم   ", "20160000"),
                        validator: (val) {
                          if (val.isEmpty) {
                            return "الرجاء ادخال رقم المستخدم";
                          } else
                            return null;
                        },
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
                        controller: passwordController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return "الرجاء ادخال كلمة المرور";
                          } else
                            return null;
                        },
                        textDirection: TextDirection.rtl,
                        decoration:
                            inputdecoration("كلمة المرور    ", "********"),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        obscureText: true,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.keyboard_arrow_left,
                            color: AppThemeData().secondaryColor),
                        Text(
                          "نسيت كلمة المرور ؟ ",
                          textDirection: TextDirection.rtl,
                          style: AppThemeData()
                              .tajwalText
                              .copyWith(fontSize: 12, color: Colors.white),
                        )
                      ],
                    ),
                    state is LoginInProgress
                        ? SpinKitDoubleBounce(
                            color: AppThemeData().secondaryColor, size: 56.0)
                        : GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                print("valid");
                                _onLoginButtonPressed(context);
                              } else
                                print("not valid");
                            },
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: double.infinity,
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppThemeData().secondaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  "تسجيل الدخول",
                                  textDirection: TextDirection.rtl,
                                  style: AppThemeData().tajwalText.copyWith(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  inputdecoration(String labelText, String hintText) {
    return InputDecoration(
      labelText: '$labelText',
      hintText: '$hintText',
      helperText: '',
      fillColor: AppThemeData().primaryColor,
      filled: true,
      hintStyle: TextStyle(color: Colors.white60),
      labelStyle: TextStyle(color: Colors.white),

      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

      //errorStyle: TextStyle(fontSize: 0),

      alignLabelWithHint: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide(color: Colors.white),
        //borderRadius: BorderRadius.circular(100),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide(color: Colors.blue, width: 2),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
    );
  }

  Future showErrorMessage(BuildContext context) {
    return showModal(
      configuration: FadeScaleTransitionConfiguration(),
      context: context,
      builder: (BuildContext context) => CustomDialog(
        title: "فشل تسجيل الدخول",
        description: "تأكد من اسم المستخدم وكلمة المرور",
        buttonText: "حسنا",
      ),
    );
  }

  Widget loadingAnimation() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.deepPurple[900],
      child: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }

  _onLoginButtonPressed(BuildContext context) {
    BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
      userId: userNameController.text.toString(),
      password: passwordController.text.toString(),
      userType: logInType,
    ));

    // BlocBuilder<LoginFirstStageBloc, LoginFirstStageState>(
    //     builder: (context, state) {

    //   if (state is StudentTypeChoosen) {
    //     BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
    //       userId: userNameController.text.toString(),
    //       password: passwordController.text.toString(),
    //       userType: "S",
    //     ));
    //   }
    //   if (state is ParentTypeChoosen) {
    //     BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
    //       userId: userNameController.text.toString(),
    //       password: passwordController.text.toString(),
    //       userType: "P",
    //     ));
    //   }
    //   if (state is TeacherTypeChoosen) {}
    //   if (state is ManagmentTypeChoosen) {}
    // });
  }

  changeStatusBarColor() {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
  }
}
