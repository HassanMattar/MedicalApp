class DoctorProfileEntity {
  final String fullName;
  final String address;
  final String phoneNumber;
  final String email;
  final String workingHours;
  final String bio;

  const DoctorProfileEntity({
    required this.fullName,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.workingHours,
    required this.bio,
  });
}
