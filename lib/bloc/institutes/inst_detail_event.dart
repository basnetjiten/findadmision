part of 'inst_detail_bloc.dart';

@immutable
abstract class InstDetailEvent {}

class FetchInstDetail extends InstDetailEvent {
  final String instId;

  FetchInstDetail({this.instId});
}
