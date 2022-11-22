import 'package:flutter/material.dart';
import 'package:riverpod_firestore_stream/widget/pages/chat_room/chat_room_page.dart';

void main() {
  runApp(const MyApp());
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
