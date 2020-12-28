part of 'firebase_token_check_bloc.dart';

@immutable
abstract class FirebaseTokenCheckState {}

class FirebaseTokenCheckInitial extends FirebaseTokenCheckState {}

class FcmTokenCheckCompleted extends FirebaseTokenCheckState {
  final FcmTokenCheckResponse fcmTokenCheckResponse;

  FcmTokenCheckCompleted({this.fcmTokenCheckResponse});
}

class FcmTokenCheckError extends FirebaseTokenCheckState {}
