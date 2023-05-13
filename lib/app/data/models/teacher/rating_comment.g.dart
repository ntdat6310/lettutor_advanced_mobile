// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingComment _$RatingCommentFromJson(Map<String, dynamic> json) =>
    RatingComment(
      id: json['id'] as String?,
      bookingId: json['bookingId'] as String?,
      studentId: json['firstId'] as String?,
      teacherId: json['secondId'] as String?,
      rating: json['rating'] as int?,
      content: json['content'] as String?,
      updatedAt: json['updatedAt'] as String?,
      studentName: json['name'] as String?,
      studentAvatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$RatingCommentToJson(RatingComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookingId': instance.bookingId,
      'firstId': instance.studentId,
      'secondId': instance.teacherId,
      'rating': instance.rating,
      'content': instance.content,
      'updatedAt': instance.updatedAt,
      'name': instance.studentName,
      'avatar': instance.studentAvatar,
    };
