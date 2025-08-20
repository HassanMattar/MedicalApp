// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'User.dart';



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
}
