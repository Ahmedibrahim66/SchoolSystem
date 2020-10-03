import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/DashBoard/NewStudentDashboard.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/bloc/studentnavigation_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentAttendence/student_attendence.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentLearningMaterial/StudentLearningMaterial.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentMarksPage/newStudentMarks.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentPayment/bloc/student_payment_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentPayment/newStudentPayment.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentProfile/StudentProfile.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentProfile/newStudentInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NavigationHome extends StatefulWidget {
  @override
  _NavigationHomeState createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<NavigationHome> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentnavigationBloc, StudentnavigationState>(
        builder: (context, state) {
      if (state is StudentnavigationInitial) {
        BlocProvider.of<StudentnavigationBloc>(context)
                            .add(NavigateToHomeScreen(context));
      }
      if(state is StudentnavigationToHome){
        return NewStudentDashboard();
      }

      if (state is StudentProfileState) {
        return NewStudentInfo();
      }

      if (state is StudentMarksState) {
        return NewStudentMarksPage();
      }
       if (state is StudentsPaymentState) {
        return NewStudentPayment();
      }

       if (state is StudentsLearningMaterialState) {
        return StudentLearningMaterial();
      }

      if (state is ChooseChild) {

   
      print("choose children");  
      }


      return Container();
    });
  }
}
