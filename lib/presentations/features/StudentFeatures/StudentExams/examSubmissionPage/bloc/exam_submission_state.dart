part of 'exam_submission_bloc.dart';

abstract class ExamSubmissionState extends Equatable {
  const ExamSubmissionState();
  
  @override
  List<Object> get props => [];
}

class ExamSubmissionInitial extends ExamSubmissionState {}

class ExamSubmissionPageLoading extends ExamSubmissionState{}

class ExamSubmissionPageLoaded extends ExamSubmissionState {
  final List<ExamQuestionAnswerModel> list;

  const ExamSubmissionPageLoaded({@required this.list})
      : assert(list != null);

  @override
  List<Object> get props => [list];
}

class ExamSubmissionPageFinished extends ExamSubmissionState {}

class ExamSubmissionPageError extends ExamSubmissionState {}