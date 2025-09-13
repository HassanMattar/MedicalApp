class DoctorListEntity {
  final int id;
  final String username;
  final String email;
  final String specialty;
  final String address;
  final String phoneNumber;
  final bool isAvailable;
  final String averageRating;

  const DoctorListEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.specialty,
    required this.address,
    required this.phoneNumber,
    required this.isAvailable,
    required this.averageRating,
  });
}
