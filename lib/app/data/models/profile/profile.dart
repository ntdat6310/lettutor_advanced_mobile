import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_advanced_mobile/app/data/models/profile/learn_topic.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  String? id;
  String? email;
  String? level;
  String? language;
  String? name;
  String? country;
  String? avatar;
  String? phone;
  String? birthday;
  List<dynamic>? courses;
  List<LearnTopic>? learnTopics;
  List<LearnTopic>? testPreparations;
  int? timezone;

  Profile({
    this.id,
    this.email,
    this.level,
    this.language,
    this.name,
    this.country,
    this.timezone,
    this.avatar,
    this.phone,
    this.birthday,
    this.courses,
    this.learnTopics,
    this.testPreparations,
  });

  factory Profile.fromJson(Map<String, dynamic> json)
  => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
