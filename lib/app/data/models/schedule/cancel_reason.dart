import 'package:json_annotation/json_annotation.dart';

part 'cancel_reason.g.dart';

@JsonSerializable()
class CancelReason {
  int id;
  String reason;
  CancelReason({
    required this.id,
    required this.reason,
});
  factory CancelReason.fromJson(Map<String, dynamic> json)
  => _$CancelReasonFromJson(json);

  Map<String, dynamic> toJson() => _$CancelReasonToJson(this);
}