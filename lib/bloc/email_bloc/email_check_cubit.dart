import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/repository/user_repo.dart';
import 'package:meta/meta.dart';
part 'email_check_state.dart';

class EmailCheckCubit extends Cubit<EmailCheckState> {
  EmailCheckCubit() : super(EmailCheckInitial());

  Future<void> checkEmail(String email) async {
    try {
      // emit(WeatherLoading());
      final inputEmail = email.trim();
      final bool valid = await getIt<UserRepository>().checkEmail(inputEmail);
      if (valid) {
        print("into this");
        emit(EmailValidStatus(message: "ok"));
      }
      emit(EmailInValidStatus(message: "notok"));
    } catch (_) {
      print("error");
      emit(EmailInValidStatus(message: "notok"));
    }
  }
}
