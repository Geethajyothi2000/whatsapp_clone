import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/CustomCard.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';
import 'package:whatsapp_clone/Screens/SelectContact.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key, required this.chatmodels, required this.sourchat}) : super(key: key);
  final List<ChatModel> chatmodels;
  final ChatModel   sourchat;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => SelectContact()),
          );
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: widget.chatmodels.length,
        itemBuilder: (context, index) =>
            CustomCard(chatModel: widget.chatmodels[index],
            sourchat: widget.sourchat,
            ),
      ),
    );
  }
}
