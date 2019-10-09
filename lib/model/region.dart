import 'package:equatable/equatable.dart';

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

  factory Region.fromJson(Map<String, dynamic> json) {
    return new Region(
      id: json['id'],
      name: json['name'],
      nestingBoxIdPrefix: json['nestingBoxIdPrefix'],
    );
  }
}
