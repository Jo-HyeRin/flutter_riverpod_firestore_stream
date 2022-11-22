import 'package:flutter/material.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildListView(),
    );
  }

  ListView _buildListView() {
    return ListView.separated(
      itemCount: 2,
      itemBuilder: (context, index) => ListTile(
        title: Text("msg: 보낸메세지내용"),
        subtitle: Text("from: 보낸사람"),
      ),
      separatorBuilder: (context, index) => Divider(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("riverpod & firestore & stream"),
    );
  }
}
