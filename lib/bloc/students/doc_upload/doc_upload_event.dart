part of 'doc_upload_bloc.dart';

@immutable
abstract class StdDocUploadEvent {}

class UploadDoc extends StdDocUploadEvent {
  final String stdId,docId,fileName;
  final File fileToUpload;

  UploadDoc({this.fileToUpload, this.stdId,this.docId,this.fileName});
}

class UploadSingleDoc extends StdDocUploadEvent {
  final String stdId,docId,fileName;
  final File fileToUpload;

  UploadSingleDoc({this.fileToUpload, this.stdId, thi,this.docId,this.fileName});
}

class UploadOtherDoc extends StdDocUploadEvent {
  final String stdId,docId,fileName;
  final File fileToUpload;

  UploadOtherDoc({this.fileToUpload, this.stdId, this.docId,this.fileName});
}
class DeleteDoc extends StdDocUploadEvent {
  final String stdId, id;

  DeleteDoc({this.id, this.stdId});
}
