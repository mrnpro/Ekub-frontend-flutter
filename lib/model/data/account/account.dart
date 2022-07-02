import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

@JsonSerializable()
class Account {
  final String? userId;
  final String? balance;
  final String? package;
  final String? packageStartedOn;
  final String? packageExpireOn;

  Account(this.userId, this.balance, this.packageStartedOn,
      this.packageExpireOn, this.package);
  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
