import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/repository/univ_repo.dart';
import 'package:meta/meta.dart';

part 'doc_upload_event.dart';

part 'doc_upload_state.dart';

class DocUploadBloc extends Bloc<DocUploadEvent, DocUploadState> {
  DocUploadBloc() : super(DocUploadInitial());

  @override
  Stream<DocUploadState> mapEventToState(
    DocUploadEvent event,
  ) async* {
    if (event is UploadDoc) {
      final docUploadRes = await getIt<UnivFilterRepository>().uploadFile(
          event.fileToUpload,
          event.stdId,
          event.instId,
          event.docId,
          event.fileName);
      if (docUploadRes.status == "success") {
        yield DocUploaded();
      } else {
        yield DocUploadFailed();
      }
    }
    if (event is UploadSingleDoc) {
      final docUploadRes = await getIt<UnivFilterRepository>().uploadSingleFile(
          event.fileToUpload,
          event.stdId,
          event.instId,
          event.docId,
          event.fileName);
      if (docUploadRes.status == "success") {
        yield DocUploaded();
      } else {
        yield DocUploadFailed();
      }
    }
    if (event is UploadOtherDoc) {
      final docUploadRes = await getIt<UnivFilterRepository>().uploadOtherFile(
          event.fileToUpload,
          event.stdId,
          event.instId,
          event.docId,
          event.fileName);
      if (docUploadRes.status == "success") {
        yield DocUploaded();
      } else {
        yield DocUploadFailed();
      }
    }
    if (event is DeleteDoc) {
      final deleteRes = await getIt<UnivFilterRepository>()
          .deleteDoc(event.id, event.stdId, event.instId);
      if (deleteRes == "success") {
        yield DocDeleted();
      } else {
        yield DocUploadFailed();
      }
    }
  }
}
