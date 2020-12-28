import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/dto/add_office.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/main.dart';
import 'package:findadmissionaffiliate/models/home/office_list.dart';
import 'package:findadmissionaffiliate/repository/office_repo.dart';
import 'package:meta/meta.dart';
import '../../main.dart';

part 'office_list_event.dart';

part 'office_list_state.dart';

class OfficeListBloc extends Bloc<OfficeListEvent, OfficeListState> {
  OfficeListBloc() : super(OfficeListInitial());

  @override
  // ignore: must_call_super
  void onTransition(Transition<OfficeListEvent, OfficeListState> transition) {
    print(transition);
  }

  @override
  Stream<OfficeListState> mapEventToState(
    OfficeListEvent event,
  ) async* {
    final officeRepo = getIt<OfficeRepository>();
    if (event is FetchOfficeList) {
      final OfficeListResponse officeListResponse =
          await officeRepo.getOfficeList(event.accessToken);

      if (officeListResponse.status == "success") {
        if (officeListResponse.officeList.isNotEmpty) {
          yield OfficeListFetched(officeListResponse: officeListResponse);
        } else {
          yield OfficeListEmpty();
        }
      }
    } else if (event is AddOfficeEvent) {
      final OfficeListResponse officeListResponse =
          await officeRepo.addOffice(accessToken, event.addOfficePostData);
      if (officeListResponse.status == "success") {
        if (officeListResponse.officeList.isNotEmpty) {
          yield OfficeListFetched(officeListResponse: officeListResponse);
        } else {
          yield OfficeListEmpty();
        }
      }
    } else if (event is RemoveOffice) {
      final OfficeListResponse officeListResponse =
          await officeRepo.removeOffice(event.officeId);
      if (officeListResponse.status == "success") {
        if (officeListResponse.officeList.isNotEmpty) {
          yield OfficeRemoved(officeListResponse: officeListResponse);
        } else {
          yield OfficeListEmpty();
        }
      }
    }

    else if (event is UpdateOfficeEvent) {
      final OfficeListResponse officeListResponse =
      await officeRepo.addOffice(accessToken, event.addOfficePostData);
      if (officeListResponse.status == "success") {
        if (officeListResponse.officeList.isNotEmpty) {
          yield OfficeListFetched(officeListResponse: officeListResponse);
        } else {
          yield OfficeListEmpty();
        }
      }
    }
  }
}
