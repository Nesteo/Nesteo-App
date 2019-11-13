import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nesteo_app/model/nestingbox.dart';
import 'package:nesteo_app/model/species.dart';
import 'package:nesteo_app/model/user.dart';

part 'inspection.g.dart';

@JsonSerializable(nullable: true)
class Inspection extends Equatable {
  final int id;
  final NestingBox nestingBox;
  final DateTime inspectionDate;
  final User inspectedByUser;
  final bool hasBeenCleaned;
  final String condition;
  final bool justRepaired;
  final bool occupied;
  final bool containsEggs;
  final int eggCount;
  final int chickCount;
  final int ringedChickCount;
  final int ageInDays;
  final String femaleParentBirdDiscovery;
  final String maleParentBirdDiscovery;
  final Species species;
  final bool hasImage;
  final String comment;
  final String lastUpdated;
  final String nestingBoxId;

  Inspection({
    this.id,
    this.nestingBox,
    this.inspectionDate,
    this.inspectedByUser,
    this.hasBeenCleaned,
    this.condition,
    this.justRepaired,
    this.occupied,
    this.containsEggs,
    this.eggCount,
    this.chickCount,
    this.ringedChickCount,
    this.ageInDays,
    this.femaleParentBirdDiscovery,
    this.maleParentBirdDiscovery,
    this.species,
    this.hasImage,
    this.comment,
    this.lastUpdated,
    this.nestingBoxId,
  });

  @override
  List<Object> get props => [
        id,
        nestingBox,
        inspectionDate,
        inspectedByUser,
        hasBeenCleaned,
        condition,
        justRepaired,
        occupied,
        containsEggs,
        eggCount,
        chickCount,
        ringedChickCount,
        ageInDays,
        femaleParentBirdDiscovery,
        maleParentBirdDiscovery,
        species,
        hasImage,
        comment,
        lastUpdated,
        nestingBoxId,
      ];

  factory Inspection.fromJson(Map<String, dynamic> json) =>
      _$InspectionFromJson(json);
  Map<String, dynamic> toJson() => _$InspectionToJson(this);
}
