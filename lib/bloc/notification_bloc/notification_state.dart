part of 'notification_bloc.dart';

@immutable
abstract class NotificationState extends Equatable {}

class NotificationInitial extends NotificationState {
  @override
  List<Object> get props => [];
}

class NotificationDataFetched extends NotificationState {
  final bool hasReachedMax;

  final List<Notilist> notificationList;

  NotificationDataFetched({this.notificationList, this.hasReachedMax});

  @override
  List<Object> get props => [this.notificationList, this.hasReachedMax];

  NotificationDataFetched copyWith({
    List<Notilist> transactionList,
    bool hasReachedMax,
  }) {
    return NotificationDataFetched(
      notificationList: transactionList ?? this.notificationList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
class FetchingNotificationList extends NotificationState{
  @override
  List<Object> get props =>[];
}
class NotificationErrorList extends NotificationState{
  @override
  List<Object> get props =>[];
}

class NotificationEmptyList extends NotificationState{
  @override
  List<Object> get props =>[];
}
