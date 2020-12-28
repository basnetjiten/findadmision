part of 'application_bloc.dart';

@immutable
abstract class ApplicationEvent {}

class FetchApplicationList extends ApplicationEvent{
  final String stdId;
  FetchApplicationList({this.stdId});
}
