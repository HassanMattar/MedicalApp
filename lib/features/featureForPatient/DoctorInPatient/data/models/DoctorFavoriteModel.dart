import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/entities/DoctorFavoriteEntity%20.dart';

class DoctorFavoriteModel extends DoctorFavoriteEntity {
  const DoctorFavoriteModel({
    required int id,
    required String fullName,
    required String address,
    required String phoneNumber,
    required int favoritesCount,
  }) : super(
          id: id,
          fullName: fullName,
          address: address,
          phoneNumber: phoneNumber,
          favoritesCount: favoritesCount,
        );

  factory DoctorFavoriteModel.fromJson(Map<String, dynamic> json) {
    int parseInt(dynamic v) {
      if (v == null) return 0;
      if (v is int) return v;
      return int.tryParse(v.toString()) ?? 0;
    }

    return DoctorFavoriteModel(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? '',
      address: json['address'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      favoritesCount: parseInt(json['favorites_count']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'address': address,
      'phone_number': phoneNumber,
      'favorites_count': favoritesCount,
    };
  }

  static List<DoctorFavoriteModel> fromJsonList(List<dynamic> list) {
    return list.map((e) => DoctorFavoriteModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}
