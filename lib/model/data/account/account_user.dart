import 'package:json_annotation/json_annotation.dart';

part 'account_user.g.dart';

@JsonSerializable()
class AccountUser {
  final String userId;
  final String balance;
  final String package;
  final String packageStartedOn;
  final String packageExpireOn;

  AccountUser(this.userId, this.balance, this.package, this.packageStartedOn,
      this.packageExpireOn);
  factory AccountUser.fromJson(Map<String, dynamic> json) =>
      _$AccountUserFromJson(json);
  Map<String, dynamic> toJson() => _$AccountUserToJson(this);
}
