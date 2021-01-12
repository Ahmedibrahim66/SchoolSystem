part of 'exam_review_page_bloc.dart';

abstract class ExamReviewPageState extends Equatable {
  const ExamReviewPageState();

  @override
  List<Object> get props => [];
}

class ExamReviewPageInitial extends ExamReviewPageState {}

class ExamReviewPageLoading extends ExamReviewPageState {}

class ExamReviewPageLoaded extends ExamReviewPageState {
  final List<ExamQuestionReviewModel> list;
  final String baseUrl;
  const ExamReviewPageLoaded({@required this.baseUrl, @required this.list})
      : assert(list != null);

  @override
  List<Object> get props => [list];
}

class ExamReviewPageError extends ExamReviewPageState {}
