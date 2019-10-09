import 'package:equatable/equatable.dart';
import 'package:nesteo_app/model/nestingbox.dart';
import 'package:nesteo_app/model/species.dart';
import 'package:nesteo_app/model/user.dart';

class Inspection extends Equatable {
  final int id;
  final NestingBox nestingBox;
  final String inspectionDate;
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
  final String imageFileName;
  final String comment;
  final String lastUpdated;

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
    this.imageFileName,
    this.comment,
    this.lastUpdated,
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
        imageFileName,
        comment,
        lastUpdated,
      ];

  @override
  String toString() {
    return 'Inspection: $id, $nestingBox, $inspectedByUser';
  }

  factory Inspection.fromJson(Map<String, dynamic> json) {
    return new Inspection(
      id: json['id'],
      nestingBox: NestingBox.fromJson(json['nestingBox']),
      inspectionDate: json['inspectionDate'],
      inspectedByUser: (json['inspectedByUser'] != null)
          ? User.fromJson(json['inspectedByUser'])
          : null,
      hasBeenCleaned: json['hasBeenCleaned'],
      condition: json['condition'],
      justRepaired: json['justRepaired'],
      occupied: json['occupied'],
      containsEggs: json['containsEggs'],
      eggCount: json['eggCount'],
      chickCount: json['chickCount'],
      ringedChickCount: json['ringedChickCount'],
      ageInDays: json['ageInDays'],
      femaleParentBirdDiscovery: json['femaleParentBirdDiscovery'],
      maleParentBirdDiscovery: json['maleParentBirdDiscovery'],
      species: Species.fromJson(json['species']),
      imageFileName: json['imageFileName'],
      comment: json['comment'],
      lastUpdated: json['lastUpdated'],
    );
  }
}
