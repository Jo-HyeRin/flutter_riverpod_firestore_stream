import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_stream/domain/chat/chat.dart';
import 'package:riverpod_firestore_stream/dto/chat/chat_req_dto.dart';

// firestore findAll
// return : Stream<List<Chat>>
final chatStreamProvider = StreamProvider<List<Chat>>((ref) {
  final db = FirebaseFirestore.instance;
  Stream<QuerySnapshot<Map<String, dynamic>>> stream = db.collection("chat").snapshots();
  return stream.map((snapshot) => snapshot.docs.map((doc) => Chat.fromJson(doc.data(), id: doc.id)).toList());

  // return FirebaseFirestore.instance.collection("chat").snapshots()
  //     .map((event) => event.docs.map((doc) => Chat.fromJson(doc.data())).toList());

  // 채팅방을 나갈 때 마무리 작업이 필요하다면(ex.채팅내용삭제, 내용로그남기기 등)
  // StreamProvider.autoDispose<List<Chat>>((
  //   ref.onDispose(() {화면죽일때});
  // ){});

});

final chatFirestoreRepositoryProvider = Provider((ref){
  return ChatFirestoreRepository();
});

class ChatFirestoreRepository {
  // Cloud Firestore 초기화
  final db = FirebaseFirestore.instance;

  // firestore insert
  Future<DocumentReference> insert(ChatInsertReqDto dto) {
    return db.collection("chat").add(dto.toJson());
  }
}