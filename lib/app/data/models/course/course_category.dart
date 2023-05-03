import 'package:json_annotation/json_annotation.dart';

part 'course_category.g.dart';

@JsonSerializable(explicitToJson: true)
class CourseCategory {
  String? id;
  String? title;
  String? key;

  CourseCategory({
    required this.id,
    required this.title,
    required this.key,
  });

  factory CourseCategory.fromJson(Map<String, dynamic> json) =>
      _$CourseCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CourseCategoryToJson(this);
}
