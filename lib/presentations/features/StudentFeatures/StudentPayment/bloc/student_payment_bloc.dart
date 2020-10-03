import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mustafa0_1/Data/mappers/StudentMappers.dart';
import 'package:mustafa0_1/Data/models/Student_payment_model.dart';
import 'package:mustafa0_1/Domain/entities/student_payment_entity.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'student_payment_event.dart';
part 'student_payment_state.dart';

class StudentPaymentBloc
    extends Bloc<StudentPaymentEvent, StudentPaymentState> {
  final StudentRepository repository;

  StudentPaymentBloc(this.repository)
      : assert(repository != null),
        super(StudentPaymentEmpty());

  @override
  Stream<StudentPaymentState> mapEventToState(
    StudentPaymentEvent event,
  ) async* {
    if (event is FetchStudentPayment) {
      yield StudentPaymentLoading();
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String token = preferences.getString('userToken');
        String userId = preferences.getString('userId');
        final List<StudentPaymentModel> list =
            await repository.getStudentPayment(token, userId);
        final List<StudentPaymentEntity> studentAbsencelist =  StudentDataMapper.paymentMapper(list);
        yield StudentPaymentLoaded(list:  studentAbsencelist);
      } catch (e) {
        print(e.toString());
        yield StudentPaymentError();
      }
    }  }
}
