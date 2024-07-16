// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiImpl _$$AiImplFromJson(Map<String, dynamic> json) => _$AiImpl(
      aiId: json['aiId'] as String,
      aiName: json['aiName'] as String,
      aiType: (json['aiType'] as num).toInt(),
      aiSpeed: (json['aiSpeed'] as num).toInt(),
    );

Map<String, dynamic> _$$AiImplToJson(_$AiImpl instance) => <String, dynamic>{
      'aiId': instance.aiId,
      'aiName': instance.aiName,
      'aiType': instance.aiType,
      'aiSpeed': instance.aiSpeed,
    };
