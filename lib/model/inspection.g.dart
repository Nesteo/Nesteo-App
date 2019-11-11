// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Inspection _$InspectionFromJson(Map<String, dynamic> json) {
  return Inspection(
    id: json['id'] as int,
    nestingBox: json['nestingBox'] == null
        ? null
        : NestingBox.fromJson(json['nestingBox'] as Map<String, dynamic>),
    inspectionDate: json['inspectionDate'] == null
        ? null
        : DateTime.parse(json['inspectionDate'] as String),
    inspectedByUser: json['inspectedByUser'] == null
        ? null
        : User.fromJson(json['inspectedByUser'] as Map<String, dynamic>),
    hasBeenCleaned: json['hasBeenCleaned'] as bool,
    condition: json['condition'] as String,
    justRepaired: json['justRepaired'] as bool,
    occupied: json['occupied'] as bool,
    containsEggs: json['containsEggs'] as bool,
    eggCount: json['eggCount'] as int,
    chickCount: json['chickCount'] as int,
    ringedChickCount: json['ringedChickCount'] as int,
    ageInDays: json['ageInDays'] as int,
    femaleParentBirdDiscovery: json['femaleParentBirdDiscovery'] as String,
    maleParentBirdDiscovery: json['maleParentBirdDiscovery'] as String,
    species: json['species'] == null
        ? null
        : Species.fromJson(json['species'] as Map<String, dynamic>),
    imageFileName: json['imageFileName'] as String,
    comment: json['comment'] as String,
    lastUpdated: json['lastUpdated'] as String,
    nestingBoxId: json['nestingBoxId'] as String,
  );
}

Map<String, dynamic> _$InspectionToJson(Inspection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nestingBox': instance.nestingBox,
      'inspectionDate': instance.inspectionDate?.toIso8601String(),
      'inspectedByUser': instance.inspectedByUser,
      'hasBeenCleaned': instance.hasBeenCleaned,
      'condition': instance.condition,
      'justRepaired': instance.justRepaired,
      'occupied': instance.occupied,
      'containsEggs': instance.containsEggs,
      'eggCount': instance.eggCount,
      'chickCount': instance.chickCount,
      'ringedChickCount': instance.ringedChickCount,
      'ageInDays': instance.ageInDays,
      'femaleParentBirdDiscovery': instance.femaleParentBirdDiscovery,
      'maleParentBirdDiscovery': instance.maleParentBirdDiscovery,
      'species': instance.species,
      'imageFileName': instance.imageFileName,
      'comment': instance.comment,
      'lastUpdated': instance.lastUpdated,
      'nestingBoxId': instance.nestingBoxId,
    };
