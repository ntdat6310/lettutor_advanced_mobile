import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_advanced_mobile/app/data/models/course/course_topic.dart';

import 'course_category.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  String id;
  String name;
  String description;
  String imageUrl;
  int level;
  @JsonKey(name: 'course_price')
  double coursePrice;
  bool visible;
  String category;
  @JsonKey(name: 'reason')
  String whyTakeThisCourse; // reason
  @JsonKey(name: 'purpose')
  String whatWillYouBeAbleToDo; // purpose
  List<CourseTopic> topics;
  List<CourseCategory> categories;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.level,
    required this.coursePrice,
    required this.visible,
    required this.category,
    required this.whatWillYouBeAbleToDo,
    required this.whyTakeThisCourse,
    required this.topics,
    required this.categories,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
