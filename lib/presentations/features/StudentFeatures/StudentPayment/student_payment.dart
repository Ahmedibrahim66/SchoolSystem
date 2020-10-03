import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentPayment/bloc/student_payment_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentPayment/student_payment_card.dart';
import 'package:mustafa0_1/presentations/widgets/LoadingAnimation.dart';

class StudentPayment extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<StudentPaymentBloc>(context)
                              .add(FetchStudentPayment());
                        },
                        child: Icon(Icons.refresh)),
                  )
                ],
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        title: Text(
          'الاقساط',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
            color: Colors.white,
            fontFamily: 'Lemonada',
          ),
        ),
      ),
      body: BlocBuilder<StudentPaymentBloc, StudentPaymentState>(
        builder: (context, state) {
          if (state is StudentPaymentEmpty) {
            BlocProvider.of<StudentPaymentBloc>(context)
                .add(FetchStudentPayment());
          }
          if (state is StudentPaymentLoaded) {
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
                    children: state.list
                        .map((absent) => StudentPaymentCard(absent))
                        .toList(),
                  ),
                ),
              ),
            );
          }

          if (state is StudentPaymentError) {
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
