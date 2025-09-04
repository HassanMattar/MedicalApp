
import '../../domain/entities/MedicalData.dart';

class MedicalDataModel extends MedicalData {
  MedicalDataModel({
    required super.diabetesType,
    required super.medical_notes,
  });

  factory MedicalDataModel.fromJson(Map<String, dynamic> json) {
    return MedicalDataModel(
      diabetesType:  json['diabetesType'] as String,
      medical_notes: json['medical_notes'] as String,
     
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'diabetesType': diabetesType,
      'medical_notes': medical_notes,
      
    };
  }

 
}
