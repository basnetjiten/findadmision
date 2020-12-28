part of 'preview_apply_bloc.dart';

@immutable
abstract class PreviewApplyState {}

class PreviewApplyInitial extends PreviewApplyState {}

class PreviewApplyFetched extends PreviewApplyState {
  final PreviewApplyRes previewApplyRes;

  PreviewApplyFetched({this.previewApplyRes});
}

class PreviewApplyFailed extends PreviewApplyState {}
