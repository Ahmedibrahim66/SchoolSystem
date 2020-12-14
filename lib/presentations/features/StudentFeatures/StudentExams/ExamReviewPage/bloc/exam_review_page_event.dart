part of 'exam_review_page_bloc.dart';

abstract class ExamReviewPageEvent extends Equatable {
  const ExamReviewPageEvent();

  @override
  List<Object> get props => [];
}

class FetchStudentExamQuestion extends ExamReviewPageEvent {
  final int examId;

  FetchStudentExamQuestion(this.examId);

  @override
  List<Object> get props => [];
}

class NextExamQuestion extends ExamReviewPageEvent {
  final int examId;
  final int nextQuestion;

  NextExamQuestion(this.examId, this.nextQuestion);

  @override
  List<Object> get props => [];
}

class PreviousExamQuestion extends ExamReviewPageEvent {
  final int examId;
  final int nextQuestion;
  PreviousExamQuestion(this.examId, this.nextQuestion);

  @override
  List<Object> get props => [];
}

class FinishExamReview extends ExamReviewPageEvent {
  FinishExamReview();

  @override
  List<Object> get props => [];
}
