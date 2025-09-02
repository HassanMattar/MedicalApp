class PatientProfileEntity {
  final String fullName;
  final String? address;
  final String? gender;
  final String? dateOfBirth;
  final String? phoneNumber;
  final String email;

  const PatientProfileEntity({
    required this.fullName,
    this.address,
    this.gender,
    this.dateOfBirth,
    this.phoneNumber,
    required this.email,
  });
}
