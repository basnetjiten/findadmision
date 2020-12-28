part of 'notification_bloc.dart';

@immutable
abstract class NotificationEvent {}

class FetchNotification extends NotificationEvent {
  final int index;

  FetchNotification({this.index});
}
