import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentBehaviour/bloc/student_behaviour_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentBehaviour/student_behavior_card.dart';
import 'package:mustafa0_1/presentations/widgets/LoadingAnimation.dart';

class BehaviourProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<StudentBehaviourBloc>(context)
                              .add(FetchStudentBehaviour());
                        },
                        child: Icon(Icons.refresh)),
                  )
                ],
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        title: Text(
          'الملف السلوكي',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
            color: Colors.white,
            fontFamily: 'Lemonada',
          ),
        ),
      ),
      body: BlocBuilder<StudentBehaviourBloc, StudentBehaviourState>(
        builder: (context, state) {
          if (state is StudentBehaviourEmpty) {
            BlocProvider.of<StudentBehaviourBloc>(context)
                .add(FetchStudentBehaviour());
          }

          if (state is StudentBehaviourLoaded) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey[900],
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: state.studentBehaviourEntity
                        .map((behaviour) => BehaviourProfileCard(behaviour))
                        .toList(),
                  ),
                ),
              ),
            );
          }

          if (state is StudentBehaviourError) {
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey[900],
              child: Text("فشل في الاتصال"),
            );
          }

          return LoadingAnimation();
        },
      ),
    );
  }
}
