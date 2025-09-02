
import '../../domain/entities/Users.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String token,
    required int userId,
    required int patientProfileId,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String userType,
  }) : super(
          token: token,
          userId: userId,
          patientProfileId: patientProfileId,
          username: username,
          email: email,
          firstName: firstName,
          lastName: lastName,
          userType: userType,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json["token"],
      userId: json["user_id"],
      patientProfileId: json["patient_profile_id"],
      username: json["username"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      userType: json["user_type"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "user_id": userId,
      "patient_profile_id": patientProfileId,
      "username": username,
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "user_type": userType,
    };
  }
}
