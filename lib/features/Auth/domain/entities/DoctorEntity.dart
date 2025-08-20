// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:equatable/equatable.dart';

import 'package:medical2/features/Auth/domain/entities/User.dart';

// ignore: must_be_immutable
class Doctor extends Equatable implements User {
    int? id;
  String? name;
  String email;
  String? address;
   String password;
  String?  phoneNumber;
  int ?favoriteNumber;
  double? rating;
  String ?qualification;
  Doctor({
     this.id,
   required  this.password,
     this.name,
    required this.email,
     this.address,
     this.favoriteNumber,
    this.rating,
     this.qualification,
    this.phoneNumber,
  }
  
  );
   String get userType => "doctor";
  
  @override
  List<Object?> get props => [id,name,email];

}
