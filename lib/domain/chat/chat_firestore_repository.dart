import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_stream/dto/chat/chat_req_dto.dart';

final chatFirestoreRepositoryProvider = Provider((ref){
  return ChatFirestoreRepository();
});

class ChatFirestoreRepository {
  // Cloud Firestore 초기화
  final db = FirebaseFirestore.instance;

  // db에 insert
  Future<DocumentReference> insert(ChatInsertReqDto dto){
    return db.collection("chat").add(dto.toJson());
  }
}