part of 'doc_upload_bloc.dart';

@immutable
abstract class DocUploadEvent {}

class UploadDoc extends DocUploadEvent {
  final String stdId, instId,docId,fileName;
  final File fileToUpload;

  UploadDoc({this.fileToUpload, this.stdId, this.instId,this.docId,this.fileName});
}

class UploadSingleDoc extends DocUploadEvent {
  final String stdId, instId,docId,fileName;
  final File fileToUpload;

  UploadSingleDoc({this.fileToUpload, this.stdId, this.instId,this.docId,this.fileName});
}

class UploadOtherDoc extends DocUploadEvent {
  final String stdId, instId,docId,fileName;
  final File fileToUpload;

  UploadOtherDoc({this.fileToUpload, this.stdId, this.instId,this.docId,this.fileName});
}
class DeleteDoc extends DocUploadEvent {
  final String stdId, instId, id;

  DeleteDoc({this.id, this.stdId, this.instId});
}
