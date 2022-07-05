// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountUser _$AccountUserFromJson(Map<String, dynamic> json) => AccountUser(
      json['userId'] as String,
      json['balance'] as String,
      json['package'] as String,
      json['packageStartedOn'] as String,
      json['packageExpireOn'] as String,
    );

Map<String, dynamic> _$AccountUserToJson(AccountUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'balance': instance.balance,
      'package': instance.package,
      'packageStartedOn': instance.packageStartedOn,
      'packageExpireOn': instance.packageExpireOn,
    };
