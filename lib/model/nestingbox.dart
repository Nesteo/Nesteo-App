import 'package:equatable/equatable.dart';
import 'package:nesteo_app/model/owner.dart';
import 'package:nesteo_app/model/region.dart';
import 'package:nesteo_app/model/user.dart';

class NestingBox extends Equatable {
  final String id;
  final Region region;
  final String oldId;
  final String foreignId;
  final double coordinateLongitude;
  final double coordinateLatitude;
  final String hangUpDate;
  final User hangUpUser;
  final Owner owner;
  final String material;
  final String holeSize;
  final String imageFileName;
  final String comment;
  final String lastUpdated;
  final int inspectionsCount;
  final String lastInspected;
  final bool isPreview;

  NestingBox({
    this.id,
    this.region,
    this.oldId,
    this.foreignId,
    this.coordinateLongitude,
    this.coordinateLatitude,
    this.hangUpDate,
    this.hangUpUser,
    this.owner,
    this.material,
    this.holeSize,
    this.imageFileName,
    this.comment,
    this.lastUpdated,
    this.inspectionsCount,
    this.lastInspected,
    this.isPreview,
  });

  @override
  List<Object> get props => [
        id,
        region,
        oldId,
        foreignId,
        coordinateLongitude,
        coordinateLatitude,
        hangUpDate,
        hangUpUser,
        owner,
        material,
        holeSize,
        imageFileName,
        comment,
        lastUpdated,
        inspectionsCount,
        lastInspected,
        isPreview,
      ];

  @override
  String toString() {
    return 'NestingBox: $id, $coordinateLongitude, $coordinateLatitude, $hangUpDate, $hangUpUser, $owner, $material, $holeSize';
  }

  factory NestingBox.fromJson(Map<String, dynamic> json) {
    return new NestingBox(
      id: json['id'],
      region: Region.fromJson(json['region']),
      oldId: json['oldId'],
      foreignId: json['foreignId'],
      coordinateLongitude: json['coordinateLongitude'],
      coordinateLatitude: json['coordinateLatitude'],
      hangUpDate: json['hangUpDate'],
      hangUpUser: (json['hangUpUser'] != null)
          ? User.fromJson(json['hangUpUser'])
          : null,
      owner: Owner.fromJson(json['owner']),
      material: json['material'],
      holeSize: json['holeSize'],
      imageFileName: json['imageFileName'],
      comment: json['comment'],
      lastUpdated: json['lastUpdated'],
      inspectionsCount: json['inspectionsCount'],
      lastInspected: json['lastInspected'],
      isPreview: false,
    );
  }

  factory NestingBox.previewFromJson(Map<String, dynamic> json) {
    return new NestingBox(
      id: json['id'],
      region: Region.fromJson(json['region']),
      oldId: json['oldId'],
      foreignId: json['foreignId'],
      coordinateLongitude: json['coordinateLongitude'],
      coordinateLatitude: json['coordinateLatitude'],
      inspectionsCount: json['inspectionsCount'],
      lastInspected: json['lastInspected'],
      isPreview: true,
    );
  }
}
