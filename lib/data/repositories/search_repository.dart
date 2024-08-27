import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class SearchRepository {
  final FirebaseFirestore _firestore;

  SearchRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  // Search users by name
  Future<List<UserModel>> searchUsersByName(String query) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: query + '\uf8ff')
          .get();
      return querySnapshot.docs.map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
