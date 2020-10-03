part of 'student_payment_bloc.dart';

abstract class StudentPaymentEvent extends Equatable {
  const StudentPaymentEvent();
}

class FetchStudentPayment extends StudentPaymentEvent {

  FetchStudentPayment();

  @override
  List<Object> get props => [];

}
