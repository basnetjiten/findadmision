import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/bloc/univ_filter_bloc/univ_filter_bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/saved_univ.dart';
import 'package:findadmissionaffiliate/models/univ.dart';
import 'package:findadmissionaffiliate/repository/univ_repo.dart';
import 'package:meta/meta.dart';

import '../../univ_global.dart';

part 'univ_filter_event.dart';

part 'univ_filter_state.dart';

class UnivFavFilterBloc extends Bloc<UnivFavFilterEvent, UnivFavFilterState> {
  UnivFavFilterBloc() : super(UnivFavFilterInitial());

  @override
  Stream<UnivFavFilterState> mapEventToState(
    UnivFavFilterEvent event,
  ) async* {
    if (event is FetchFavUnivData) {
      final univFilterApiRes =
          await getIt<UnivFilterRepository>().getUnivFavList();

      if (univFilterApiRes is SavedUnivList) {
      //  print("TEST HERE" + univFilterApiRes.status);
        if (univFilterApiRes.status == "success" && univFilterApiRes.match.isNotEmpty) {

          yield UnivFavDataFetched(savedUnivList: univFilterApiRes);
        }else{
          yield UnivFavEmptyData();
        }
      } else {
        yield UnivFavEmptyData();
      }
    }
  }
}
