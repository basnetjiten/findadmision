import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/univ.dart';
import 'package:findadmissionaffiliate/repository/univ_repo.dart';
import 'package:meta/meta.dart';

import '../../univ_global.dart';

part 'univ_filter_event.dart';

part 'univ_filter_state.dart';

class UnivFilterBloc extends Bloc<UnivFilterEvent, UnivFilterState> {
  UnivFilterBloc() : super(UnivFilterInitial());

  @override
  Stream<UnivFilterState> mapEventToState(
    UnivFilterEvent event,
  ) async* {
    if (event is FetchUnivData) {
      final univFilterApiRes =
          await getIt<UnivFilterRepository>().getUnivList();

      if (univFilterApiRes is UnivFilterResponse) {
      //  print("TEST HERE" + univFilterApiRes.status);
        if (univFilterApiRes.status == "success") {
          univFilterResponse = univFilterApiRes;
          degreeList = univFilterApiRes.degree;
          activeCountryList = univFilterApiRes.activecountry;
          cityList = univFilterApiRes.citylist;
          startDateList = univFilterApiRes.startdates;
          yield UnivDataFetched(univFilterResponse: univFilterApiRes);
        }
      } else {
        yield UnivEmptyData();
      }
    }
  }
}
