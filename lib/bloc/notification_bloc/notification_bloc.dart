import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/notification_list.dart';
import 'package:findadmissionaffiliate/repository/user_repo.dart';
import 'package:meta/meta.dart';

part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial());

  @override
  Stream<NotificationState> mapEventToState(
    NotificationEvent event,
  ) async* {
    final currentState = state;

    if (event is FetchNotification && !_hasReachedMax(currentState)) {
      //yield FetchingNotificationList();
      try {
        if (currentState is NotificationInitial) {
          final notificationRes = await _fetchNotificationList(event.index);
          if (notificationRes != null) {
            notificationListRes = notificationRes;
            yield NotificationDataFetched(
                notificationList: notificationRes.notilist,
                hasReachedMax: false);
          } else {
            NotificationEmptyList();
          }
        }
        if (currentState is NotificationDataFetched) {
          // print("INDEXXX" + event.index.toString());
          final notificationRes = await _fetchNotificationList(event.index);
          if (notificationRes != null) {
            yield notificationRes.notilist.isEmpty
                ? currentState.copyWith(hasReachedMax: true)
                : NotificationDataFetched(
                    notificationList: currentState.notificationList +
                        notificationRes.notilist,
                    hasReachedMax: false);
          } else {
            yield currentState.copyWith(hasReachedMax: true);
          }
        }
      } catch (_) {
        yield NotificationErrorList();
      }
    }
  }

  bool _hasReachedMax(NotificationState state) =>
      state is NotificationDataFetched && state.hasReachedMax;

  Future<NotificationListRes> _fetchNotificationList(index) async {
    final NotificationListRes notificationListRes =
        await getIt<UserRepository>().fetchNotificationList(index);
    if (notificationListRes.notilist.isNotEmpty) {
      return notificationListRes;
    } else {
      return null;
    }
  }
}
