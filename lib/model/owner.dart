import 'package:equatable/equatable.dart';

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

  factory Owner.fromJson(Map<String, dynamic> json) {
    return new Owner(
      id: json['id'],
      name: json['name'],
    );
  }
}
