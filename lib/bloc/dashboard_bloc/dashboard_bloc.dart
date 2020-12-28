import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/dashboard_data.dart';
import 'package:findadmissionaffiliate/repository/user_repo.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial());

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if(event is FetchDashBoardData){
      dashboardDataRes = await getIt<UserRepository>().fetchDashboardData();
     // print(dashboardDataRes.toString());

    }


  }
}
