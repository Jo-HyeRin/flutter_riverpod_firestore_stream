import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatFirestoreRepository = Provider((ref){
  return ChatFirestoreRepository();
});

class ChatFirestoreRepository {
  // Cloud Firestore 초기화
  final db = FirebaseFirestore.instance;
}