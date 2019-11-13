import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(nullable: true, includeIfNull: false)
class User extends Equatable {
  final String id;
  final String userName;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  User(
      {this.id,
      this.userName,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber});

  @override
  List<Object> get props =>
      [id, userName, firstName, lastName, email, phoneNumber];

  @override
  String toString() {
    return 'User: $id, $userName, $firstName, $lastName, $email, $phoneNumber';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
