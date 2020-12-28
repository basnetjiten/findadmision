import 'package:findadmissionaffiliate/datasources/univ_ds.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UnivFilterRepository {
  final UnivFilterDS univDS = UnivFilterDS(httpClient: http.Client());

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return 'token';
  }
  Future<dynamic> getUnivFavList() async {
    return univDS.fetchFilteredFavUniv();
  }
  Future<dynamic> getUnivList() async {
    return univDS.fetchFilteredUniv();
  }
  Future<dynamic> getInstituteDetail(instId) async{
    return univDS.fetchInstituteDetail(instId);
  }
  Future<dynamic> getPreviewApply(studentId,instId,) async{
    return univDS.fetchPreviewApply(studentId,instId);
  }

  Future<dynamic> getSubmitApply(studentId,instId,) async{
    return univDS.fetchSubmitApply(studentId,instId);
  }
  Future<dynamic> getAppliedCourse(level,courses,studentId,instId,) async{
    return univDS.fetchAppliedCourse(level,courses,studentId,instId);
  }

  Future<dynamic> loadFileData(studentId,instId) async{
    return univDS.loadFileData(studentId,instId);
  }

  Future<dynamic> uploadFile(file,studentId,instId,docId,fileName) async{
    return univDS.uploadFile(file,studentId,instId,docId,fileName);
  }
  Future<dynamic> uploadSingleFile(file,studentId,instId,docId,fileName) async{
    return univDS.uploadSingleFile(file,studentId,instId,docId,fileName);
  }
  Future<dynamic> uploadOtherFile(file,studentId,instId,docId,fileName) async{
    return univDS.uploadOtherFile(file,studentId,instId,docId,fileName);
  }

  Future<String> deleteDoc(id,studentId,instId) async{
    return univDS.deleteDoc(id,studentId,instId);
  }

/*  Future<dynamic> deleteWorkExp(id,studentId,instId) async{
    return univDS.deleteWorkExp(id,studentId,instId);
  }*/

  Future<dynamic> storeWorkExp(studentId,workExpDto) async{
    return univDS.storeWorkExp(studentId,workExpDto);
  }
}
