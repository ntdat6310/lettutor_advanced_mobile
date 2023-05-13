// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      level: json['level'] as String?,
      coursePrice: (json['course_price'] as num?)?.toDouble(),
      visible: json['visible'] as bool?,
      whatWillYouBeAbleToDo: json['purpose'] as String?,
      whyTakeThisCourse: json['reason'] as String?,
      topics: (json['topics'] as List<dynamic>?)
          ?.map((e) => CourseTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'level': instance.level,
      'course_price': instance.coursePrice,
      'visible': instance.visible,
      'reason': instance.whyTakeThisCourse,
      'purpose': instance.whatWillYouBeAbleToDo,
      'topics': instance.topics,
    };
