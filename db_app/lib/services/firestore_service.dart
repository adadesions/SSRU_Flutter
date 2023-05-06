import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  static void getTasks() async {
    final db = FirebaseFirestore.instance;
    final snapshot = await db.collection('todos').get();
    List<DocumentSnapshot> docs = snapshot.docs;

    for (DocumentSnapshot doc in docs) {
      print('${doc['id']}: ${doc['task']}, ${doc['dueDate']}');
    }
  }
}
