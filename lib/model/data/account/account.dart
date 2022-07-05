import 'package:ekub/model/data/account/account_user.dart';
import 'package:ekub/model/data/account/days.dart';

import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

@JsonSerializable()
class Account {
  final AccountUser result;

  final Days days;
  Account(
    this.result,
    this.days,
  );
  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
