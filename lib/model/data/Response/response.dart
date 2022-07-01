import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class ServerResponse {
  final String? token;
  final String? msg;

  ServerResponse(this.token, this.msg);
  factory ServerResponse.fromJson(Map<String, dynamic> json) =>
      _$ServerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ServerResponseToJson(this);
}
