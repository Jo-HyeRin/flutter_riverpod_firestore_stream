import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_stream/domain/chat/chat_firestore_repository.dart';
import 'package:riverpod_firestore_stream/dto/chat/chat_req_dto.dart';

final chatControllerProvider = Provider((ref){
  return ChatController(ref);
});

class ChatController {

  Ref _ref;
  ChatController(this._ref);

  void insert(ChatInsertReqDto dto) async {
    DocumentReference doc = await _ref.read(chatFirestoreRepositoryProvider).insert(dto);
    doc.snapshots(); // 오브젝트 타입 데이터
    print("디버그: ${doc.snapshots()}");
    print("디버그: ${doc.id}");
  }

}