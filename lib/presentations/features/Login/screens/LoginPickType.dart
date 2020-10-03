import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/presentations/features/Login/screens/LoginPickSchool.dart';
import 'package:mustafa0_1/presentations/features/Authentication/bloc/authentication_bloc.dart';

class LoginPickType extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPickType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple[900],
        // status bar color
        brightness: Brightness.dark,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple[900],
                Colors.deepPurple[800],
                Colors.deepPurple[400]
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'مرحباً، أيّهم أنت ؟',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lemonada',
                      color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                     
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return BlocProvider.value(
                            value: BlocProvider.of<AuthenticationBloc>(context),
                            child: LoginPickSchool(),
                          );
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                            elevation: 15.0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Stack(
                              overflow: Overflow.clip,
                              children: <Widget>[
                                Positioned(
                                  child: Image.asset(
                                    'assets/student.png',
                                    width: 150,
                                    height: 180,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: -50,
                                  child: Transform.rotate(
                                    angle: -45.0,
                                    child: Container(
                                      width: 150,
                                      height: 15,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[900]),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    width: 150,
                                    height: 40,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight:
                                                  Radius.circular(20))),
                                      color: Colors.grey[900],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'طالب',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Lemonada',
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                          elevation: 15.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            overflow: Overflow.clip,
                            children: <Widget>[
                              Positioned(
                                child: Image.asset(
                                  'assets/teacher.png',
                                  width: 150,
                                  height: 180,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: -50,
                                child: Transform.rotate(
                                  angle: -45.0,
                                  child: Container(
                                    width: 150,
                                    height: 15,
                                    decoration:
                                        BoxDecoration(color: Colors.grey[900]),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  width: 150,
                                  height: 40,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    color: Colors.grey[900],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'معلم',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Lemonada',
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                          elevation: 15.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            overflow: Overflow.clip,
                            children: <Widget>[
                              Positioned(
                                child: Image.asset(
                                  'assets/parent.png',
                                  width: 150,
                                  height: 180,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: -50,
                                child: Transform.rotate(
                                  angle: -45.0,
                                  child: Container(
                                    width: 150,
                                    height: 15,
                                    decoration:
                                        BoxDecoration(color: Colors.grey[900]),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  width: 150,
                                  height: 40,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    color: Colors.grey[900],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'ولي أمر',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Lemonada',
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                          elevation: 15.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            overflow: Overflow.clip,
                            children: <Widget>[
                              Positioned(
                                child: Image.asset(
                                  'assets/admin.png',
                                  width: 150,
                                  height: 180,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: -50,
                                child: Transform.rotate(
                                  angle: -45.0,
                                  child: Container(
                                    width: 150,
                                    height: 15,
                                    decoration:
                                        BoxDecoration(color: Colors.grey[900]),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  width: 150,
                                  height: 40,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    color: Colors.grey[900],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'إدارة',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Lemonada',
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
