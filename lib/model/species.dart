import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'species.g.dart';

@JsonSerializable(nullable: false)
class Species extends Equatable {
  final int id;
  final String name;

  Species({this.id, this.name});

  @override
  List<Object> get props => [id, name];

  @override
  String toString() {
    return 'Species: $id, $name';
  }

  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);
  Map<String, dynamic> toJson() => _$SpeciesToJson(this);
}
