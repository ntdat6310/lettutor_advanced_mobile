// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'become_tutor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BecomeTutor _$BecomeTutorFromJson(Map<String, dynamic> json) => BecomeTutor(
      id: json['id'] as String?,
      video: json['video'] as String?,
      bio: json['bio'] as String?,
      education: json['education'] as String?,
      experience: json['experience'] as String?,
      interests: json['interests'] as String?,
      specialties: json['specialties'] as String?,
      languages: json['languages'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      isActivated: json['isActivated'] as bool?,
    );

Map<String, dynamic> _$BecomeTutorToJson(BecomeTutor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'video': instance.video,
      'bio': instance.bio,
      'education': instance.education,
      'experience': instance.experience,
      'interests': instance.interests,
      'specialties': instance.specialties,
      'languages': instance.languages,
      'rating': instance.rating,
      'isActivated': instance.isActivated,
    };
