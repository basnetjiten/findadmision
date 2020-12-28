part of 'doc_upload_bloc.dart';

@immutable
abstract class StdDocUploadState {}

class DocUploadInitial extends StdDocUploadState {}

class DocUploading extends StdDocUploadState {}

class DocUploaded extends StdDocUploadState {}

class DocDeleted extends StdDocUploadState {}

class DocUploadFailed extends StdDocUploadState {}
