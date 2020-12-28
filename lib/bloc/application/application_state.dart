part of 'application_bloc.dart';

@immutable
abstract class ApplicationState {}

class ApplicationInitial extends ApplicationState {}

class ApplicationListFetched extends ApplicationState {
  final ApplicationListRes applicationListRes;
  ApplicationListFetched({this.applicationListRes});
}

class ApplicationFetchFailed extends ApplicationState {}
class EmptyApplicationList extends ApplicationState {}
