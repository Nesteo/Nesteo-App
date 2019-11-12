// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) {
  return Region(
    id: json['id'] as int,
    name: json['name'] as String,
    nestingBoxIdPrefix: json['nestingBoxIdPrefix'] as String,
  );
}

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nestingBoxIdPrefix': instance.nestingBoxIdPrefix,
    };
