part of 'doc_fetch_bloc.dart';

@immutable
abstract class StdDocFetchEvent {}

class FetchDoc extends StdDocFetchEvent {
  final String stdId, instId;

  FetchDoc({this.stdId, this.instId});
}

class ReFetchDoc extends StdDocFetchEvent {
  final String stdId, instId;

  ReFetchDoc({this.stdId, this.instId});
}
