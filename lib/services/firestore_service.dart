import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveDiary(String userId, String diary, DateTime date, String photoUrl) async {
    await _db.collection('diaries').add({
      'userId': userId,
      'diary': diary,
      'date': date,
      'photoUrl': photoUrl,
    });
  }

  Future<List<Map<String, dynamic>>> getUserAnswers(String userId) async {
    final snapshot = await _db.collection('answers').where('userId', isEqualTo: userId).get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
