part of 'exam_submission_bloc.dart';

abstract class ExamSubmissionEvent extends Equatable {
  const ExamSubmissionEvent();

  @override
  List<Object> get props => [];
}

class FetchStudentExamQuestion extends ExamSubmissionEvent {
  final int examId;

  FetchStudentExamQuestion(this.examId);

  @override
  List<Object> get props => [];
}

class NextExamQuestion extends ExamSubmissionEvent {
  final int examId;
  final int nextQuestion;

  NextExamQuestion(this.examId, this.nextQuestion);

  @override
  List<Object> get props => [];
}

class PreviousExamQuestion extends ExamSubmissionEvent {
  final int examId;
  final int nextQuestion;
  PreviousExamQuestion(this.examId, this.nextQuestion);

  @override
  List<Object> get props => [];
}

class SubmitExamQuestionAnswer extends ExamSubmissionEvent {
  final int examId;
  final String questionId;
  final String answer;
  final String isEnd;
  final String nextQeustion;
  final File file;
  SubmitExamQuestionAnswer(this.examId, this.answer, this.questionId,
      this.isEnd, this.nextQeustion, this.file);

  @override
  List<Object> get props => [];
}

class FinishExamReview extends ExamSubmissionEvent {
  FinishExamReview();

  @override
  List<Object> get props => [];
}
