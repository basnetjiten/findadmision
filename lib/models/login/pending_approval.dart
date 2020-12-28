import 'package:json_annotation/json_annotation.dart';
part 'pending_approval.g.dart';
@JsonSerializable()
class PendingApproval {
  String email;
  String message;
  String status;

  PendingApproval(this.email, this.message, this.status);

  factory PendingApproval.fromJson(Map<String, dynamic> json) =>
      _$PendingApprovalFromJson(json);

  Map<String, dynamic> toJson() => _$PendingApprovalToJson(this);
}
