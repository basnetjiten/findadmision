part of 'office_list_bloc.dart';

@immutable
abstract class OfficeListState {}

class OfficeListInitial extends OfficeListState {}

class OfficeListFetched extends OfficeListState{
  final OfficeListResponse officeListResponse;
  OfficeListFetched({this.officeListResponse});
}

class OfficeRemoved extends OfficeListState{
  final OfficeListResponse officeListResponse;
  OfficeRemoved({this.officeListResponse});
}
class OfficeListEmpty extends OfficeListState{}
