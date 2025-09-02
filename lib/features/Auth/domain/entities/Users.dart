class UserEntity {
  final String token;
  final int userId;
  final int patientProfileId;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String userType;

  const UserEntity({
    required this.token,
    required this.userId,
    required this.patientProfileId,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.userType,
  });
}
