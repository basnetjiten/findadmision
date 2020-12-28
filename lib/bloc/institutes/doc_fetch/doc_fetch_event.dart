part of 'doc_fetch_bloc.dart';

@immutable
abstract class DocFetchEvent {}

class FetchDoc extends DocFetchEvent {
  final String stdId, instId;

  FetchDoc({this.stdId, this.instId});
}

class ReFetchDoc extends DocFetchEvent {
  final String stdId, instId;

  ReFetchDoc({this.stdId, this.instId});
}
