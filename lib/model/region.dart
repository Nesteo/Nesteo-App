import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'region.g.dart';

@JsonSerializable(nullable: false)
class Region extends Equatable {
  final int id;
  final String name;
  final String nestingBoxIdPrefix;

  Region({this.id, this.name, this.nestingBoxIdPrefix});

  @override
  List<Object> get props => [id, name, nestingBoxIdPrefix];

  @override
  String toString() {
    return 'Region: $id, $name, $nestingBoxIdPrefix';
  }

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
