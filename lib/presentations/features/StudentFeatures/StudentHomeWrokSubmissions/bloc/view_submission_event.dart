part of 'view_submission_bloc.dart';

abstract class ViewSubmissionEvent extends Equatable {
  const ViewSubmissionEvent();

  @override
  List<Object> get props => [];
}

class ViewHomeworkSubmission extends ViewSubmissionEvent {
  final String homewrokSeq;

  ViewHomeworkSubmission(this.homewrokSeq);
}
