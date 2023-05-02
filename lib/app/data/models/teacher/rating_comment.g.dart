// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingComment _$RatingCommentFromJson(Map<String, dynamic> json) =>
    RatingComment(
      id: json['id'] as String?,
      rating: json['rating'] as int?,
      content: json['content'] as String?,
      time: json['updatedAt'] as String?,
      student: json['firstInfo'] == null
          ? null
          : Profile.fromJson(json['firstInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RatingCommentToJson(RatingComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'content': instance.content,
      'updatedAt': instance.time,
      'firstInfo': instance.student?.toJson(),
    };
