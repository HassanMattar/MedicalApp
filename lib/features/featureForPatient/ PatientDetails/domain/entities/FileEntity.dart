class FileEntity {
  final int id;
  final int patient;
  final String patientName;
  final String file;
  final String? description;
  final DateTime uploadedAt;
  final String fileUrl;

  const FileEntity({
    required this.id,
    required this.patient,
    required this.patientName,
    required this.file,
    this.description,
    required this.uploadedAt,
    required this.fileUrl,
  });
}
