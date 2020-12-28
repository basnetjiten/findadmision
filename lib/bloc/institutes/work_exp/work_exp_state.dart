part of 'work_exp_bloc.dart';

@immutable
abstract class WorkExpState {}

class WorkExpInitial extends WorkExpState {}

class WorkExpSubmitted extends WorkExpState {
  final WorkExpRes workExpRes;

  WorkExpSubmitted({this.workExpRes});
}

class WorkExpError extends WorkExpState {}
