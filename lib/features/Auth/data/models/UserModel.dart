
import '../../domain/entities/Users.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.username,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.userType,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user_id'],
      username: json['username'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'] ?? '',
      userType: json['user_type'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": id,
      "username": username,
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "user_type": userType,
      "token": token,
    };
  }
}
