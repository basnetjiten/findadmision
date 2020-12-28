part of 'save_inst_bloc.dart';

@immutable
abstract class SaveInstState {}

class SaveInstInitial extends SaveInstState {}

class InstSaved extends SaveInstState {}

class InstDeleted extends SaveInstState {}

class InstOperationFailed extends SaveInstState {}
