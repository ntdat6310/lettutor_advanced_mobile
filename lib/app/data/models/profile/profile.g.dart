// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      language: json['language'] as String?,
      birthday: json['birthday'] as String?,
      studySchedule: json['studySchedule'] as String?,
      isPhoneActivated: json['isPhoneActivated'] as bool?,
      level: json['level'] as String?,
      testPreparations: (json['testPreparations'] as List<dynamic>?)
          ?.map((e) => TestPreparation.fromJson(e as Map<String, dynamic>))
          .toList(),
      becomeTutor: json['tutorInfo'] == null
          ? null
          : BecomeTutor.fromJson(json['tutorInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'avatar': instance.avatar,
      'country': instance.country,
      'phone': instance.phone,
      'language': instance.language,
      'birthday': instance.birthday,
      'studySchedule': instance.studySchedule,
      'isPhoneActivated': instance.isPhoneActivated,
      'level': instance.level,
      'testPreparations': instance.testPreparations,
      'tutorInfo': instance.becomeTutor,
    };
