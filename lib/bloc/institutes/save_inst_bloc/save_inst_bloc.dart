import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/repository/user_repo.dart';
import 'package:meta/meta.dart';

part 'save_inst_event.dart';

part 'save_inst_state.dart';

class SaveInstBloc extends Bloc<SaveInstEvent, SaveInstState> {
  SaveInstBloc() : super(SaveInstInitial());

  @override
  Stream<SaveInstState> mapEventToState(
    SaveInstEvent event,
  ) async* {
    if (event is SaveInst) {
      final savedStatus = await getIt<UserRepository>().saveInst(event.instId);
      if (savedStatus == "success") {
        yield InstSaved();
      }
    }
    if (event is DeleteInst) {
      final deletedStatus =
          await getIt<UserRepository>().deleteInst(event.instId);
      if (deletedStatus == "success") {
        yield InstDeleted();
      }
    }
  }
}
