
import 'package:json_annotation/json_annotation.dart';

part 'course_category.g.dart';
@JsonSerializable(explicitToJson: true)
class CourseCategory{
  String? title;
  String? key;

  CourseCategory({
    this.title,
    this.key,
  });

  factory CourseCategory.fromJson(Map<String, dynamic> json)
  => _$CourseCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CourseCategoryToJson(this);
}