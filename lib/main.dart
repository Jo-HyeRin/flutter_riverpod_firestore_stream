import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_stream/firebase_options.dart';
import 'package:riverpod_firestore_stream/widget/pages/chat_room/chat_room_page.dart';

void main() async {

  // 메인 메서드에 비동기 작업이 있으면 꼭 필요하다.
  WidgetsFlutterBinding.ensureInitialized();

  // 그림 그리기 전에 Firebase 실행.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    // 위젯에서 프로바이더를 사용하고 읽기위해
    // 앱 전체적으로 "ProviderScope" 위젯을 감싸줘야 합니다.
    // 여기에 프로바이더의 상태가 저장됩니다.
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatRoomPage(),
    );
  }
}
