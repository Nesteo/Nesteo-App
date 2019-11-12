import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nesteo_app/model/owner.dart';
import 'package:nesteo_app/model/region.dart';
import 'package:nesteo_app/model/user.dart';

part 'nestingbox.g.dart';

@JsonSerializable(nullable: true)
class NestingBox extends Equatable {
  final String id;
  final Region region;
  final String oldId;
  final String foreignId;
  final double coordinateLongitude;
  final double coordinateLatitude;
  final DateTime hangUpDate;
  final User hangUpUser;
  final Owner owner;
  final String material;
  final String holeSize;
  final String imageFileName;
  final String comment;
  final String lastUpdated;
  final int inspectionsCount;
  final DateTime lastInspected;

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
      ];

  @override
  String toString() {
    return 'NestingBox: $id, $coordinateLongitude, $coordinateLatitude, $hangUpDate, $hangUpUser, $owner, $material, $holeSize';
  }

  factory NestingBox.fromJson(Map<String, dynamic> json) =>
      _$NestingBoxFromJson(json);
  Map<String, dynamic> toJson() => _$NestingBoxToJson(this);
}
