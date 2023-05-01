import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_advanced_mobile/app/data/models/teacher/rating_comment.dart';

part 'teacher.g.dart';

@JsonSerializable()
class Teacher {
  String? userId;
  String? level;
  String? email;
  String? avatar;
  String? name;
  String? country;
  String? phone;
  String? birthday;
  List<RatingComment>? feedbacks;
  String? video;
  String? bio;
  String? experience;
  String? interests;
  String? languages;
  String? specialties;
  String? resume;
  double? rating;

  Teacher({
    this.userId,
    this.level,
    this.email,
    this.avatar,
    this.name,
    this.country,
    this.phone,
    this.birthday,
    // List<RatingComment>? feedbacks,
    this.feedbacks,
    this.video,
    this.bio,
    this.experience,
    this.interests,
    this.languages,
    this.specialties,
    this.resume,
    // double? rating,
    this.rating,
  });

  factory Teacher.fromJson(Map<String, dynamic> json)
  => _$TeacherFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}
