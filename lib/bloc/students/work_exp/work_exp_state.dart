part of 'work_exp_bloc.dart';

@immutable
abstract class StdWorkExpState {}

class WorkExpInitial extends StdWorkExpState {}

class WorkExpSubmitted extends StdWorkExpState {
  final WorkExpRes workExpRes;

  WorkExpSubmitted({this.workExpRes});
}

class WorkExpError extends StdWorkExpState {}
