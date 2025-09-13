import 'package:medical2/Core/constant.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/patientProfileEntity.dart';

class PatientProfileModel extends PatientProfileEntity {
  const PatientProfileModel({
    required String fullName,
    String? address,
    String? gender,
    String? dateOfBirth,
    String? phoneNumber,
     String? email,
  }) : super(
          fullName: fullName,
          address: address,
          gender: gender,
          dateOfBirth: dateOfBirth,
          phoneNumber: phoneNumber,
          email: email,
        );
  factory PatientProfileModel.fromJson(Map<String, dynamic> json) {
    return PatientProfileModel(
      fullName: json["full_name"] ?? "",
      address: json["address"],
      gender: json["gender"],
      dateOfBirth: json["date_of_birth"],
      phoneNumber: json["phone_number"],
      email: json["email"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "full_name": fullName,
      "address": address,
      "gender": gender,
      "date_of_birth":dateOfBirth!.contains('/')? convertDateFormat(dateOfBirth!):dateOfBirth,
      "phone_number": phoneNumber,
      "email": email,
    };
  }
}
