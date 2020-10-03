part of 'student_payment_bloc.dart';

abstract class StudentPaymentState extends Equatable {
  const StudentPaymentState();

  @override
  List<Object> get props => [];

}

class StudentPaymentEmpty extends StudentPaymentState {}

class StudentPaymentLoading extends StudentPaymentState{}

class StudentPaymentLoaded extends StudentPaymentState {
  final List<StudentPaymentEntity> list;

  const StudentPaymentLoaded({@required this.list})
      : assert(list != null);

  @override
  List<Object> get props => [list];
}

class StudentPaymentError extends StudentPaymentState {}
