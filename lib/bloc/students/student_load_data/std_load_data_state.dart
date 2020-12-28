part of 'std_load_data_bloc.dart';

@immutable
abstract class StdLoadDataState {}

class StdLoadDataInitial extends StdLoadDataState {}

class StdDataLoaded extends StdLoadDataState {
  final StdLoadDataRes stdLoadDataRes;

  StdDataLoaded({this.stdLoadDataRes});
}

class StdDataLoadError extends StdLoadDataState {}
