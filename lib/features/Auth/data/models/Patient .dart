// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../domain/entities/User.dart';

class Patient implements User {
  String? name;
  final String? address;
  final String? gender;
  final String? dateOfBirth;
  final String? phoneNumber;
  final String email;
  final String password;

  Patient({
    this.name,
    this.address,
    this.gender,
    this.dateOfBirth,
    this.phoneNumber,
    required this.email,
    required this.password,
  });

  String get userType => "Patient";

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      name: json['name'],
      address: json['address'],
      gender: json['gender'],
      dateOfBirth: json['dateOfBirth'] ,
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      password: json['password'],
    );
  }

  // Convert Patient to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
    };
  }

  
}
