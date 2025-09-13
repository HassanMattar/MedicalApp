import 'package:medical2/features/featuresForDoctor/DoctorDetails/domain/entities/DoctorProfileEntity.dart';

class DoctorProfileModel extends DoctorProfileEntity {
  const DoctorProfileModel({
    required String fullName,
    required String address,
    required String phoneNumber,
    required String email,
    required String workingHours,
    required String bio,
  }) : super(
          fullName: fullName,
          address: address,
          phoneNumber: phoneNumber,
          email: email,
          workingHours: workingHours,
          bio: bio,
        );

  factory DoctorProfileModel.fromJson(Map<String, dynamic> json) {
    return DoctorProfileModel(
      fullName: json['full_name'] ?? '',
      address: json['address'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      email: json['email'] ?? '',
      workingHours: json['working_hours'] ?? '',
      bio: json['bio'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'address': address,
      'phone_number': phoneNumber,
      'email': email,
      'working_hours': workingHours,
      'bio': bio,
    };
  }
}
