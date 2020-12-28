part of 'pin_verification_bloc.dart';

@immutable
abstract class PinVerificationState {}

class PinVerificationInitial extends PinVerificationState {}
class PinVerificationValid extends PinVerificationState {}
class PinVerificationInvalid extends PinVerificationState {}
class PinResentToEmail extends PinVerificationState {}
class PinVerificationValidDoLogin extends PinVerificationState {}
