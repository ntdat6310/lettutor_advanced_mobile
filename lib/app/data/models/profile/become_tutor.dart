import 'package:json_annotation/json_annotation.dart';

part 'become_tutor.g.dart';

@JsonSerializable()
class BecomeTutor {
  String? id;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? interests;
  String? specialties;
  String? languages;
  double? rating;
  bool? isActivated;

  BecomeTutor({
    this.id,
    this.video,
    this.bio,
    this.education,
    this.experience,
    this.interests,
    this.specialties,
    this.languages,
    this.rating,
    this.isActivated,
  });

  factory BecomeTutor.fromJson(Map<String, dynamic> json) =>
      _$BecomeTutorFromJson(json);

  Map<String, dynamic> toJson() => _$BecomeTutorToJson(this);
}
