// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      json['userId'] as String?,
      json['balance'] as String?,
      json['packageStartedOn'] as String?,
      json['packageExpireOn'] as String?,
      json['package'] as String?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'userId': instance.userId,
      'balance': instance.balance,
      'packageStartedOn': instance.packageStartedOn,
      'packageExpireOn': instance.packageExpireOn,
    };
