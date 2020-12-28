part of 'doc_upload_bloc.dart';

@immutable
abstract class DocUploadState {}

class DocUploadInitial extends DocUploadState {}
class DocUploading extends DocUploadState {}
class DocUploaded extends DocUploadState{}
class DocDeleted extends DocUploadState{}
class DocUploadFailed extends DocUploadState{}
