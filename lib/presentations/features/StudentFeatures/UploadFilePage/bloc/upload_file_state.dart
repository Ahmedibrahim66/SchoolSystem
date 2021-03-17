part of 'upload_file_bloc.dart';

abstract class UploadFileState extends Equatable {
  const UploadFileState();

  @override
  List<Object> get props => [];
}

class UploadFileInitial extends UploadFileState {}

class UploadFileSuccessful extends UploadFileState {}

class UploadFileFailed extends UploadFileState {}

class UploadFileLoading extends UploadFileState {}
