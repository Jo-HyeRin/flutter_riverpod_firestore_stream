import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_stream/core/route_enum.dart';
import 'package:riverpod_firestore_stream/domain/chat/chat_firestore_repository.dart';
import 'package:riverpod_firestore_stream/dto/chat/chat_req_dto.dart';

final chatControllerProvider = Provider((ref){
  return ChatController(ref);
});

class ChatController {

  Ref _ref;
  ChatController(this._ref);

  void insert(ChatInsertReqDto dto) async {
    Future<DocumentReference> futureDoc = _ref.read(chatFirestoreRepositoryProvider).insert(dto);
    //print("디버그: ${futureDoc.snapshots()}");
    //print("디버그: ${futureDoc.id}");

    futureDoc.then(
          (value){
              print("document id: ${value.id}");
              // 여기서는 화면이동
              // Navigator.pushNamed(context, Routes.login.path);
              // Navigator.popAndPushNamed(context, Routes.login.path);
              // Navigator.pop(context); // 현재화면을 제거하고 빠져나온다
              // Navigator.pushNamedAndRemoveUntil(context, Routes.login.path, (route) => false); // 새화면 띄우면서 이전 화면 다 제거
            },
    ).onError(
        (error, stackTrace){
          print("error: ${error}");
          // 여기서는 경고창 (에러메시지)
        },
    );
  }

}