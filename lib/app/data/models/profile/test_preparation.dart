import 'package:json_annotation/json_annotation.dart';

part 'test_preparation.g.dart';

@JsonSerializable()
class TestPreparation {
  String id;
  String key;
  String name;

  TestPreparation({
    required this.id,
    required this.key,
    required this.name,
  });

  factory TestPreparation.fromJson(Map<String, dynamic> json) =>
      _$TestPreparationFromJson(json);

  Map<String, dynamic> toJson() => _$TestPreparationToJson(this);
}
