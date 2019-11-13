// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nestingbox.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NestingBox _$NestingBoxFromJson(Map<String, dynamic> json) {
  return NestingBox(
    id: json['id'] as String,
    region: json['region'] == null
        ? null
        : Region.fromJson(json['region'] as Map<String, dynamic>),
    oldId: json['oldId'] as String,
    foreignId: json['foreignId'] as String,
    coordinateLongitude: (json['coordinateLongitude'] as num)?.toDouble(),
    coordinateLatitude: (json['coordinateLatitude'] as num)?.toDouble(),
    hangUpDate: json['hangUpDate'] == null
        ? null
        : DateTime.parse(json['hangUpDate'] as String),
    hangUpUser: json['hangUpUser'] == null
        ? null
        : User.fromJson(json['hangUpUser'] as Map<String, dynamic>),
    owner: json['owner'] == null
        ? null
        : Owner.fromJson(json['owner'] as Map<String, dynamic>),
    material: json['material'] as String,
    holeSize: json['holeSize'] as String,
    hasImage: json['hasImage'] as bool,
    comment: json['comment'] as String,
    lastUpdated: json['lastUpdated'] as String,
    inspectionsCount: json['inspectionsCount'] as int,
    lastInspected: json['lastInspected'] == null
        ? null
        : DateTime.parse(json['lastInspected'] as String),
  );
}

Map<String, dynamic> _$NestingBoxToJson(NestingBox instance) =>
    <String, dynamic>{
      'id': instance.id,
      'region': instance.region?.toJson(),
      'oldId': instance.oldId,
      'foreignId': instance.foreignId,
      'coordinateLongitude': instance.coordinateLongitude,
      'coordinateLatitude': instance.coordinateLatitude,
      'hangUpDate': instance.hangUpDate?.toIso8601String(),
      'hangUpUser': instance.hangUpUser?.toJson(),
      'owner': instance.owner?.toJson(),
      'material': instance.material,
      'holeSize': instance.holeSize,
      'hasImage': instance.hasImage,
      'comment': instance.comment,
      'lastUpdated': instance.lastUpdated,
      'inspectionsCount': instance.inspectionsCount,
      'lastInspected': instance.lastInspected?.toIso8601String(),
    };
