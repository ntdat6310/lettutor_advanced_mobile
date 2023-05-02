import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_advanced_mobile/app/data/models/profile/profile.dart';

part 'rating_comment.g.dart';

@JsonSerializable(explicitToJson: true)
class RatingComment {
  String? id;
  int? rating;
  String? content;

  @JsonKey(name: 'updatedAt')
  String? time;

  @JsonKey(name: 'firstInfo')
  Profile? student;

  RatingComment({
    this.id,
    this.rating,
    this.content,
    this.time,
    this.student,
  });

  factory RatingComment.fromJson(Map<String, dynamic> json) =>
      _$RatingCommentFromJson(json);

  Map<String, dynamic> toJson() => _$RatingCommentToJson(this);
}
