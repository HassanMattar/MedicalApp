// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:medical2/features/Auth/domain/entities/DoctorEntity.dart';

// ignore: must_be_immutable
class DoctorModel extends Doctor {
  DoctorModel({
    required super.id,
    required super.name,
    required super.email,
    required super.address,
    required super.phoneNumber,
    required super.favoriteNumber,
    required super.rating,
    required super.qualification,
    required super.password,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      favoriteNumber: json['favoriteNumber'],
      rating: (json['rating'] as num?)?.toDouble(),
      qualification: json['qualification'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'phoneNumber': phoneNumber,
      'favoriteNumber': favoriteNumber,
      'rating': rating,
      'qualification': qualification,
      'userType': userType,
    };
  }
}
