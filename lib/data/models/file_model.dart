class FileModel {
  final String id;
  final String name;
  final String url;
  final String size;
  final DateTime uploadedAt;

  FileModel({
    required this.id,
    required this.name,
    required this.url,
    required this.size,
    required this.uploadedAt,
  });

  // Factory constructor to create a FileModel from a JSON map
  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      size: json['size'],
      uploadedAt: DateTime.parse(json['uploadedAt']),
    );
  }

  // Method to convert FileModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'size': size,
      'uploadedAt': uploadedAt.toIso8601String(),
    };
  }
}
