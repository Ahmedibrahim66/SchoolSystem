import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/ChatList/chatlist.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/DashBoard/NewStudentDashboard.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/Messages/MessagesRecived/MessagesUI.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/bloc/studentnavigation_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentExams/studentExamsPage.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentHomeworkMaterial/StudentHomeWorkMaterial.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentLearningMaterial/StudentLearningMaterial.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentMarksPage/newStudentMarks.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentPayment/newStudentPayment.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentProfile/newStudentInfo.dart';

/// this class is the home of the logic for the navigation drawer
/// here the in this class according to the state in the bloc builder and
/// the StudentnavigationBloc this page will show the correct page
/// accordingly
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
      if (state is StudentnavigationToHome) {
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

      if (state is StudentsHomeWorkMaterialState) {
        return StudentHomeworkMaterial();
      }

      if (state is StudentsExamState) {
        return StudentExamsPage();
      }

      if (state is ChooseChild) {}

      if (state is StudentsDiscussionState) {
        return ChatList();
      }

      if (state is StudentsMessagesState) {
        return MessagesUI();
      }

      return Container();
    });
  }
}
