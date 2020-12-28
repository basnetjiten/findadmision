import 'package:findadmissionaffiliate/bloc/email_bloc/email_check_cubit.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/repository/user_repo.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class SignUpFormBloc extends FormBloc<String, String> {
  // ignore: close_sinks
  /* SelectFieldBloc gender = SelectFieldBloc<String, String>(
    items: ["Mr", "Mrs", "Miss"],
    validators: [FieldBlocValidators.required],
  );*/

  // ignore: close_sinks
  final emailAddress = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );

  // ignore: close_sinks

  SignUpFormBloc() {
    addFieldBlocs(fieldBlocs: [
      emailAddress,
    ]);
    emailAddress.addAsyncValidators(
      [_checkEmailExists],
    );
  }

  @override
  void onSubmitting() async {
    try {

    } catch (e) {
    }
  }

  Future<String> _checkEmailExists(String emailAddress) async {
    final bool valid = await getIt<UserRepository>().checkEmail(emailAddress);
    if (!valid) {

      return "This email Address already exists.";
      //emitFailure(failureResponse: "Email is Already Taken");
    }
    return null;
  }
}
