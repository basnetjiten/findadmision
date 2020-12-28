part of 'std_load_data_bloc.dart';

@immutable
abstract class StdLoadDataEvent {}
class FetchStdLoadData extends StdLoadDataEvent{
  final String stdId;
  FetchStdLoadData({this.stdId});
}
