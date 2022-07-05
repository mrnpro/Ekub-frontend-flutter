// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'days.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Days _$DaysFromJson(Map<String, dynamic> json) => Days(
      (json['days'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['currentday'] as String,
    );

Map<String, dynamic> _$DaysToJson(Days instance) => <String, dynamic>{
      'currentday': instance.currentday,
      'days': instance.days,
    };
