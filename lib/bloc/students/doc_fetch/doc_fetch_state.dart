part of 'doc_fetch_bloc.dart';

@immutable
abstract class StdDocFetchState {}

class DocFetchInitial extends StdDocFetchState {}
class DocFetching extends StdDocFetchState {}

class DocFetched extends StdDocFetchState {
  final StdLoadDataRes fileDataRes;

  DocFetched({this.fileDataRes});
}

class ReFetched extends StdDocFetchState {
  final StdLoadDataRes fileDataRes;

  ReFetched({this.fileDataRes});
}

class DocFetchError extends StdDocFetchState {}

