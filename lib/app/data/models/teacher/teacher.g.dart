// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
      userId: json['userId'] as String?,
      level: json['level'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      birthday: json['birthday'] as String?,
      video: json['video'] as String?,
      bio: json['bio'] as String?,
      experience: json['experience'] as String?,
      interests: json['interests'] as String?,
      languages: json['languages'] as String?,
      specialties: json['specialties'] as String?,
      resume: json['resume'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      isFavorite:
          const RxBoolConverter().fromJson(json['isfavoritetutor'] as bool),
    );

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'userId': instance.userId,
      'level': instance.level,
      'email': instance.email,
      'avatar': instance.avatar,
      'name': instance.name,
      'country': instance.country,
      'phone': instance.phone,
      'birthday': instance.birthday,
      'video': instance.video,
      'bio': instance.bio,
      'experience': instance.experience,
      'interests': instance.interests,
      'languages': instance.languages,
      'specialties': instance.specialties,
      'resume': instance.resume,
      'rating': instance.rating,
      'isfavoritetutor': const RxBoolConverter().toJson(instance.isFavorite),
    };
