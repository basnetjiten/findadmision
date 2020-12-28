part of 'pin_verification_bloc.dart';

@immutable
abstract class PinVerificationEvent {}

class PinVerificationBtnPressed extends PinVerificationEvent {
  final String pin, email;

  PinVerificationBtnPressed({this.pin, this.email});
}

class ResendPinVerification extends PinVerificationEvent {
  final String email;

  ResendPinVerification({this.email});
}
