part of 'preview_apply_bloc.dart';

@immutable
abstract class PreviewApplyEvent {}
class FetchPreviewData extends PreviewApplyEvent{
  final String stdId,instID;
  FetchPreviewData({this.stdId,this.instID});
}
