import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class FollowersRepository {
  final FirebaseFirestore _firestore;

  FollowersRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  // Fetch followers for a specific user
  Future<List<UserModel>> fetchFollowers(String userId) async {
    try {
      final querySnapshot = await _firestore
          .collection('followers')
          .doc(userId)
          .collection('userFollowers')
          .get();

      return querySnapshot.docs
          .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
