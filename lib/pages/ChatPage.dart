import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/CustomCard.dart';
import 'package:whatsapp_clone/Screens/SelectContact.dart';
import 'package:whatsapp_clone/model/chatModel.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "John Doe",
      icon: "person.svg",
      isGroup: false,
      time: "15:30",
      currentMessage: "Hey, how are you?",
    ),
    ChatModel(
      name: "Family Group",
      icon: "assets/groups.svg",
      isGroup: true,
      time: "14:30",
      currentMessage: "Are you coming to the party?",
    ),
    ChatModel(
      name: "Alex Johnson",
      icon: "person.svg",
      isGroup: false,
      time: "13:30",
      currentMessage: "See you tomorrow!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (builder)=> SelectContact()));
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return CustomCard(chatModel: chats[index]);
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChatPage(),
  ));
}
