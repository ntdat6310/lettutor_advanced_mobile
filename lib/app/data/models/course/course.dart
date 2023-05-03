import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_advanced_mobile/app/data/models/course/course_topic.dart';

import 'course_category.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? level;
  @JsonKey(name: 'course_price')
  double? coursePrice;
  bool? visible;
  @JsonKey(name: 'reason')
  String? whyTakeThisCourse; // reason
  @JsonKey(name: 'purpose')
  String? whatWillYouBeAbleToDo; // purpose
  List<CourseTopic>? topics;

  Course({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.level,
    this.coursePrice,
    this.visible,
    this.whatWillYouBeAbleToDo,
    this.whyTakeThisCourse,
    this.topics,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
