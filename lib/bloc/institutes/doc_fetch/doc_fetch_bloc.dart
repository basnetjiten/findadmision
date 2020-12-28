import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/institute/load_data_res.dart';
import 'package:findadmissionaffiliate/repository/univ_repo.dart';
import 'package:meta/meta.dart';

part 'doc_fetch_event.dart';

part 'doc_fetch_state.dart';

//LoadFileDataRes fileDataRes;

class DocFetchBloc extends Bloc<DocFetchEvent, DocFetchState> {
  DocFetchBloc() : super(DocFetchInitial());

  @override
  Stream<DocFetchState> mapEventToState(
    DocFetchEvent event,
  ) async* {
    if (event is FetchDoc ) {
     yield DocFetching();
      final loadFileDataRes = await getIt<UnivFilterRepository>()
          .loadFileData(event.stdId, event.instId);

      if (loadFileDataRes is LoadFileDataRes) {
        yield DocFetched(fileDataRes: loadFileDataRes);
      } else {
        yield DocFetchError();
      }
    }

    if (event is ReFetchDoc ) {
      yield DocFetching();
      final loadFileDataRes = await getIt<UnivFilterRepository>()
          .loadFileData(event.stdId, event.instId);

      if (loadFileDataRes is LoadFileDataRes) {
        yield ReFetched(fileDataRes: loadFileDataRes);
      } else {
        yield DocFetchError();
      }
    }
  }
}
