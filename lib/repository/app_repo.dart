import 'package:findadmissionaffiliate/datasources/app_ds.dart';
import 'package:http/http.dart' as http;

class ApplicationRepo {
  final ApplicationDS applicationDS = ApplicationDS(httpClient: http.Client());

  Future<dynamic> getApplicationList(stdId) async {
    return applicationDS.fetchApplList(stdId);
  }

  Future<dynamic> applyFirstStep(stepOneDto,String stdId,String instId,String studyLevel) async {
    return applicationDS.applyFirstStep(stepOneDto,stdId,instId,studyLevel);
  }


}
