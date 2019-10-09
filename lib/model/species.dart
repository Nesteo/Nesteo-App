import 'package:equatable/equatable.dart';

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

  factory Species.fromJson(Map<String, dynamic> json) {
    return new Species(
      id: json['id'],
      name: json['name'],
    );
  }
}
