import 'package:json_annotation/json_annotation.dart';

part 'learn_topic.g.dart';

@JsonSerializable()
class LearnTopic{
  int id;
  String key;
  String name;

  LearnTopic({
    required this.id,
    required this.key,
    required this.name,
  });

  factory LearnTopic.fromJson(Map<String, dynamic> json)
  => _$LearnTopicFromJson(json);

  Map<String, dynamic> toJson() => _$LearnTopicToJson(this);
}