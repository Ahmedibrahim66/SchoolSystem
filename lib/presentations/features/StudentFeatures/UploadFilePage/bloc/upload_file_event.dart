part of 'upload_file_bloc.dart';

abstract class UploadFileEvent extends Equatable {
  const UploadFileEvent();

  @override
  List<Object> get props => [];
}

class UploadEvent extends UploadFileEvent {
  final List<File> files;
  final int homeWorkSeq;
  UploadEvent(this.files, this.homeWorkSeq);
}
