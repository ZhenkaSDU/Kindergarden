// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saveChild_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveChild _$SaveChildFromJson(Map<String, dynamic> json) => SaveChild(
      json['session_id'] as String,
      json['id'] as String,
      json['first_name'] as String,
      json['last_name'] as String,
      json['parents'] as String,
    );

Map<String, dynamic> _$SaveChildToJson(SaveChild instance) => <String, dynamic>{
      'session_id': instance.session_id,
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'parents': instance.parents,
    };
