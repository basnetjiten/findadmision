import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/institute/application_list_res.dart';
import 'package:findadmissionaffiliate/models/login/error.dart';
import 'package:findadmissionaffiliate/repository/app_repo.dart';
import 'package:meta/meta.dart';

part 'application_event.dart';

part 'application_state.dart';



class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationInitial());

  @override
  Stream<ApplicationState> mapEventToState(
    ApplicationEvent event,
  ) async* {
    try {
      if (event is FetchApplicationList) {
        final applicationList =
            await getIt<ApplicationRepo>().getApplicationList(event.stdId);
        if (applicationList is ApplicationListRes) {
          if (applicationList.match.isNotEmpty) {

            yield ApplicationListFetched(applicationListRes: applicationList);
          } else {
            yield EmptyApplicationList();
          }
        } else if (applicationList is LoginError) {
          yield ApplicationFetchFailed();
        }
      }
    } catch (_) {
      yield ApplicationFetchFailed();
    }
  }
}
