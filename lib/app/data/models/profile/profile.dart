import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_advanced_mobile/app/data/models/profile/test_preparation.dart';

import 'become_tutor.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  String? language;
  String? birthday;
  String? studySchedule;
  bool? isPhoneActivated;
  String? level;
  List<TestPreparation>? testPreparations;
  BecomeTutor? becomeTutor;

  Profile({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.studySchedule,
    this.isPhoneActivated,
    this.level,
    this.testPreparations,
    this.becomeTutor,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
