
import 'package:json_annotation/json_annotation.dart';

part 'course_topic.g.dart';

@JsonSerializable(explicitToJson: true)
class CourseTopic{
  String? id;
  String? courseId;
  int? orderCourse;
  String? name;
  String? nameFile;
  int? numberOfPages;
  String? description;
  String? videoUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  CourseTopic({
    this.id,
    this.courseId,
    this.orderCourse,
    this.name,
    this.nameFile,
    this.numberOfPages,
    this.description,
    this.videoUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory CourseTopic.fromJson(Map<String, dynamic> json)
  => _$CourseTopicFromJson(json);

  Map<String, dynamic> toJson() => _$CourseTopicToJson(this);
}