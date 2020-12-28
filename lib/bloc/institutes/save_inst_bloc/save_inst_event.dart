part of 'save_inst_bloc.dart';

@immutable
abstract class SaveInstEvent {}

class SaveInst extends SaveInstEvent{
  final String instId;
  SaveInst({this.instId});
}

class DeleteInst extends SaveInstEvent{
  final String instId;
  DeleteInst({this.instId});
}
