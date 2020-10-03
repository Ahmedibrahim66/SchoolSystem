import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/presentations/features/Login/screens/FinalStageLogin.dart';
import 'package:mustafa0_1/presentations/features/Authentication/bloc/authentication_bloc.dart';

class LoginPickSchool extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginPickSchool> {
  List<String> _schools = [];

  @override
  void initState() {
    super.initState();

    _schools = [
      'مدرسة كفرمالك الثانوية',
      'مدرسة أبو فلاح الأساسية',
      'مدرسة ذكور بيرزيت الأساسية',
      'مدرسة كفرمالك الثانوية',
      'مدرسة أبو فلاح الأساسية',
      'مدرسة ذكور بيرزيت الأساسية',
      'مدرسة كفرمالك الثانوية',
      'مدرسة أبو فلاح الأساسية',
      'مدرسة ذكور بيرزيت الأساسية',
      'مدرسة كفرمالك الثانوية',
      'مدرسة أبو فلاح الأساسية',
      'مدرسة ذكور بيرزيت الأساسية',
      'مدرسة كفرمالك الثانوية',
      'مدرسة أبو فلاح الأساسية',
      'مدرسة ذكور بيرزيت الأساسية',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple[900],
        // status bar color
        brightness: Brightness.dark,
      ),
      body: Container(
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
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                '... قم باختيار مدرستك',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lemonada',
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/school.png',
                        width: 150,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DropdownButtonHideUnderline(
                          child: Container(
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.0, style: BorderStyle.solid),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  canvasColor: Colors.grey[900],
                                ),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.grey[900],
                                  ),
                                  items: _schools.map((String school) {
                                    return DropdownMenuItem(
                                      value: school,
                                      child: Container(
                                        color: Colors.grey[900],
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              school,
                                              style: TextStyle(
                                                fontFamily: 'Lemonada',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.school,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String value) {
                                     
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return BlocProvider.value(
                                        value:
                                            BlocProvider.of<AuthenticationBloc>(
                                                context),
                                        child: FinalStageLogin(),
                                      );
                                    }));
                                  },
                                  iconSize: 40,
                                  elevation: 16,
                                  style: TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.grey[900],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
