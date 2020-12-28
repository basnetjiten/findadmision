part of 'doc_fetch_bloc.dart';

@immutable
abstract class DocFetchState {}

class DocFetchInitial extends DocFetchState {}
class DocFetching extends DocFetchState {}

class DocFetched extends DocFetchState {
  final LoadFileDataRes fileDataRes;

  DocFetched({this.fileDataRes});
}

class ReFetched extends DocFetchState {
  final LoadFileDataRes fileDataRes;

  ReFetched({this.fileDataRes});
}

class DocFetchError extends DocFetchState {}

