import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/entities/DoctorListEntity.dart';

class DoctorListModel extends DoctorListEntity {
  const DoctorListModel({
    required int id,
    required String username,
    required String email,
    required String specialty,
    required String address,
    required String phoneNumber,
    required bool isAvailable,
    required String averageRating,
  }) : super(
          id: id,
          username: username,
          email: email,
          specialty: specialty,
          address: address,
          phoneNumber: phoneNumber,
          isAvailable: isAvailable,
          averageRating: averageRating,
        );

  factory DoctorListModel.fromJson(Map<String, dynamic> json) {
    return DoctorListModel(
      id: json['id'] ?? 0,
      username: json['user']?['username'] ?? '',
      email: json['user']?['email'] ?? '',
      specialty: json['specialty'] ?? '',
      address: json['address'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      isAvailable: json['is_available'] ?? false,
      averageRating: json['average_rating'] ?? '0.00',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': {
        'username': username,
        'email': email,
      },
      'specialty': specialty,
      'address': address,
      'phone_number': phoneNumber,
      'is_available': isAvailable,
      'average_rating': averageRating,
    };
  }

  /// Parse list of doctors
  static List<DoctorListModel> listFromJson(List<dynamic> list) {
    return list.map((item) => DoctorListModel.fromJson(item)).toList();
  }
}
