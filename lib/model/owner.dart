import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner.g.dart';

@JsonSerializable(nullable: false)
class Owner extends Equatable {
  final int id;
  final String name;

  Owner({this.id, this.name});

  @override
  List<Object> get props => [id, name];

  @override
  String toString() {
    return 'Owner: $id, $name';
  }

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
