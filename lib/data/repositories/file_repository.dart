import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/file_model.dart';

class FileRepository {
  final FirebaseFirestore _firestore;

  FileRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  // Fetch all files
  Future<List<FileModel>> fetchFiles() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('files').get();
      return querySnapshot.docs.map((doc) => FileModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      rethrow;
    }
  }

  // Upload a file
  Future<void> uploadFile(FileModel file) async {
    try {
      await _firestore.collection('files').doc(file.id).set(file.toJson());
    } catch (e) {
      rethrow;
    }
  }

  // Delete a file
  Future<void> deleteFile(String id) async {
    try {
      await _firestore.collection('files').doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }
}
