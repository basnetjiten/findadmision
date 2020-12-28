import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/main.dart';
import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:findadmissionaffiliate/repository/univ_repo.dart';
import 'package:findadmissionaffiliate/repository/user_repo.dart';
import 'package:meta/meta.dart';

part 'inst_detail_event.dart';

part 'inst_detail_state.dart';

class InstDetailBloc extends Bloc<InstDetailEvent, InstDetailState> {
  InstDetailBloc() : super(InstDetailInitial());

  @override
  Stream<InstDetailState> mapEventToState(
    InstDetailEvent event,
  ) async* {
    try {
      if (event is FetchInstDetail) {

        final instDetailResponse = await getIt<UnivFilterRepository>()
            .getInstituteDetail(event.instId);

        if (instDetailResponse is InstituteDetailRes) {
          if (instDetailResponse.status == "success") {
            yield InstDetailFetched(instituteDetailRes: instDetailResponse);
          }
        } else {
          yield InstDetailError();
        }
      }
    } catch (_) {
      print("DETAILS ERROR"+_.toString());
      yield InstDetailError();
    }
  }
}
