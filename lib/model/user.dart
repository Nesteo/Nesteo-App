import 'package:equatable/equatable.dart';

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

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
      id: json['id'],
      userName: json['userName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
