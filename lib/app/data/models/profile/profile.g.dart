// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as String?,
      email: json['email'] as String?,
      level: json['level'] as String?,
      language: json['language'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      timezone: json['timezone'] as int?,
      avatar: json['avatar'] as String?,
      phone: json['phone'] as String?,
      birthday: json['birthday'] as String?,
      courses: json['courses'] as List<dynamic>?,
      learnTopics: (json['learnTopics'] as List<dynamic>?)
          ?.map((e) => LearnTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
      testPreparations: (json['testPreparations'] as List<dynamic>?)
          ?.map((e) => LearnTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'level': instance.level,
      'language': instance.language,
      'name': instance.name,
      'country': instance.country,
      'avatar': instance.avatar,
      'phone': instance.phone,
      'birthday': instance.birthday,
      'courses': instance.courses,
      'learnTopics': instance.learnTopics,
      'testPreparations': instance.testPreparations,
      'timezone': instance.timezone,
    };
