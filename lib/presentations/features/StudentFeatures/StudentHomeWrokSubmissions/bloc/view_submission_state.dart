part of 'view_submission_bloc.dart';

abstract class ViewSubmissionState extends Equatable {
  const ViewSubmissionState();

  @override
  List<Object> get props => [];
}

class ViewSubmissionInitial extends ViewSubmissionState {}

class StudentHomeworkSubmissionLoaded extends ViewSubmissionState {
  final List<StudentHomeworkMaterialSubmission> list;

  StudentHomeworkSubmissionLoaded(this.list);
}

class StudentHomeworkSubmissionLoading extends ViewSubmissionState {}

class StudentHomeworkSubmissionFailed extends ViewSubmissionState {}
