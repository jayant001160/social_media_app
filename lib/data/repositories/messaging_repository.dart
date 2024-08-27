import 'package:cloud_firestore/cloud_firestore.dart';

class MessagingRepository {
  final FirebaseFirestore _firestore;

  MessagingRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  // Send a message
  Future<void> sendMessage(String chatId, Map<String, dynamic> message) async {
    try {
      await _firestore.collection('chats').doc(chatId).collection('messages').add(message);
    } catch (e) {
      rethrow;
    }
  }

  // Fetch messages for a chat
  Future<List<Map<String, dynamic>>> fetchMessages(String chatId) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .get();
      return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      rethrow;
    }
  }
}
