class DoctorEntity {
  final int id;
  final String username;
  final String specialty;
  final String address;
  final String phoneNumber;
  final String bio;
  final String workingHours;
  final bool isAvailable;
  final String averageRating;
  final bool isFavorited;

  const DoctorEntity({
    required this.id,
    required this.username,
    required this.specialty,
    required this.address,
    required this.phoneNumber,
    required this.bio,
    required this.workingHours,
    required this.isAvailable,
    required this.averageRating,
    required this.isFavorited,
  });
}
