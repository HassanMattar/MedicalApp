import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/entities/DoctorEntiy.dart';

class DoctorModel extends DoctorEntity {
  const DoctorModel({
    required super.id,
    required super.username,
    required super.specialty,
    required super.address,
    required super.phoneNumber,
    required super.bio,
    required super.workingHours,
    required super.isAvailable,
    required super.averageRating,
    required super.isFavorited,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      username: json['username'],
      specialty: json['specialty'],
      address: json['address'],
      phoneNumber: json['phone_number'],
      bio: json['bio'],
      workingHours: json['working_hours'],
      isAvailable: json['is_available'],
      averageRating: json['average_rating'],
      isFavorited: json['is_favorited'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'specialty': specialty,
      'address': address,
      'phone_number': phoneNumber,
      'bio': bio,
      'working_hours': workingHours,
      'is_available': isAvailable,
      'average_rating': averageRating,
      'is_favorited': isFavorited,
    };
  }
   static List<DoctorModel> fromJsonList(List<dynamic> list) {
    return list.map((item) => DoctorModel.fromJson(item)).toList();
  }
}
