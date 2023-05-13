import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

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
  String? video;
  String? bio;
  String? experience;
  String? interests;
  String? languages;
  String? specialties;
  String? resume;
  double? rating;
  @JsonKey(name: 'isfavoritetutor')
  @RxBoolConverter()
  RxBool isFavorite = false.obs;

  Teacher({
    this.userId,
    this.level,
    this.email,
    this.avatar,
    this.name,
    this.country,
    this.phone,
    this.birthday,
    this.video,
    this.bio,
    this.experience,
    this.interests,
    this.languages,
    this.specialties,
    this.resume,
    this.rating,
    required this.isFavorite,
  });

  factory Teacher.fromJson(Map<String, dynamic> json)
  => _$TeacherFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}

class RxBoolConverter implements JsonConverter<RxBool, bool> {
  const RxBoolConverter();

  @override
  RxBool fromJson(bool json) {
    return json.obs;
  }

  @override
  bool toJson(RxBool object) {
    return object.value;
  }
}