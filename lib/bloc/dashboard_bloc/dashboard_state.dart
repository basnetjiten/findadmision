part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}
class DashboardDataFetched extends DashboardState {
  final DashboardDataRes dashboardDataRes;
  DashboardDataFetched(this.dashboardDataRes);
}
