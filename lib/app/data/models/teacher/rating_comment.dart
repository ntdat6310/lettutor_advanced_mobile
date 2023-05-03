import 'package:json_annotation/json_annotation.dart';

part 'rating_comment.g.dart';

@JsonSerializable(explicitToJson: true)
class RatingComment {
  String? id;
  String? bookingId;
  @JsonKey(name: 'firstId')
  String? studentId;
  @JsonKey(name: 'secondId')
  String? teacherId;
  int? rating;
  String? content;
  String? updatedAt;
  @JsonKey(name: 'name')
  String? studentName;
  @JsonKey(name: 'avatar')
  String? studentAvatar;

  RatingComment({
    this.id,
    this.bookingId,
    this.studentId,
    this.teacherId,
    this.rating,
    this.content,
    this.updatedAt,
    this.studentName,
    this.studentAvatar,
  });

  factory RatingComment.fromJson(Map<String, dynamic> json) =>
      _$RatingCommentFromJson(json);

  Map<String, dynamic> toJson() => _$RatingCommentToJson(this);
}
