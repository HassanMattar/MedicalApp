

import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/FileEntity.dart';

class FileModel extends FileEntity {
  const FileModel({
    required int id,
    required int patient,
    required String patientName,
    required String file,
    String? description,
    required DateTime uploadedAt,
    required String fileUrl,
  }) : super(
          id: id,
          patient: patient,
          patientName: patientName,
          file: file,
          description: description,
          uploadedAt: uploadedAt,
          fileUrl: fileUrl,
        );

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
      id: json['id'],
      patient: json['patient'],
      patientName: json['patient_name'] ?? '',
      file: json['file'],
      description: json['description'],
      uploadedAt: DateTime.parse(json['uploaded_at']),
      fileUrl: json['file_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient': patient,
      'patient_name': patientName,
      'file': file,
      'description': description,
      'uploaded_at': uploadedAt.toIso8601String(),
      'file_url': fileUrl,
    };
  }
  static List<FileModel> fromJsonList(List<dynamic> list) {
    return list.map((item) => FileModel.fromJson(item)).toList();
  }
  
}
