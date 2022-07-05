import 'package:json_annotation/json_annotation.dart';

part 'days.g.dart';

@JsonSerializable()
class Days {
  final String currentday;
  final List<String>? days;

  Days(
    this.days,
    this.currentday,
  );
  factory Days.fromJson(Map<String, dynamic> json) => _$DaysFromJson(json);
  Map<String, dynamic> toJson() => _$DaysToJson(this);
}
