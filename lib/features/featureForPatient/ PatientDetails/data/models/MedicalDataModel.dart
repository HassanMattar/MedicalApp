
import '../../domain/entities/MedicalData.dart';

class MedicalDataModel extends MedicalData {
  MedicalDataModel({
    required super.diabetesType,
    required super.conditionDescription,
    required super.attachments,
  });

  factory MedicalDataModel.fromJson(Map<String, dynamic> json) {
    return MedicalDataModel(
      diabetesType:  json['diabetesType'] as String,
      conditionDescription: json['conditionDescription'] as String,
      attachments:json['attachments'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'diabetesType': diabetesType,
      'conditionDescription': conditionDescription,
      'attachments': attachments,
    };
  }

 
}
