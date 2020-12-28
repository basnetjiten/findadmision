part of 'office_list_bloc.dart';

@immutable
abstract class OfficeListEvent {}

class FetchOfficeList extends OfficeListEvent {
  final String accessToken;

  FetchOfficeList({this.accessToken});
}

class AddOfficeEvent extends OfficeListEvent {
  final AddOfficePostData addOfficePostData;

  AddOfficeEvent({this.addOfficePostData});
}

class UpdateOfficeEvent extends OfficeListEvent {
  final AddOfficePostData addOfficePostData;

  UpdateOfficeEvent({this.addOfficePostData});
}

class RemoveOffice extends OfficeListEvent {
  final String officeId;

  RemoveOffice({this.officeId});
}
