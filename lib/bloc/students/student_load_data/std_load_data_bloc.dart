import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/student/std_load_data.dart';
import 'package:findadmissionaffiliate/repository/student_repo.dart';
import 'package:meta/meta.dart';

part 'std_load_data_event.dart';

part 'std_load_data_state.dart';

class StdLoadDataBloc extends Bloc<StdLoadDataEvent, StdLoadDataState> {
  StdLoadDataBloc() : super(StdLoadDataInitial());

  @override
  Stream<StdLoadDataState> mapEventToState(
    StdLoadDataEvent event,
  ) async* {
    if (event is FetchStdLoadData) {
      yield StdLoadDataInitial();
      final stdLoadDataRes =
          await getIt<StudentRepo>().loadStdData(event.stdId);
      if (stdLoadDataRes is StdLoadDataRes) {
        yield StdDataLoaded(stdLoadDataRes: stdLoadDataRes);
      } else {
        yield StdDataLoadError();
      }
    }
  }
}
