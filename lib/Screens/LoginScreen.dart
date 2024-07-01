import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/ButtonCard.dart'; // Import ButtonCard widget
import 'package:whatsapp_clone/Model/ChatModel.dart';
import 'package:whatsapp_clone/Screens/Homescreen.dart'; // Import ChatModel

class LoginScreen extends StatefulWidget {
  LoginScreen({required Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
late ChatModel sourceChat;
  List<ChatModel> chatmodels = [
    ChatModel(
      name: "John Doe",
      icon: Icons.person,
      isGroup: false,
      time: "15:30",
      currentMessage: "Hey, how are you?",
      status: "Accepted",
      id: 1,
    ),
    ChatModel(
      name: "Alex Johnson",
      icon: Icons.person,
      isGroup: false,
      time: "13:30",
      currentMessage: "See you tomorrow!",
      status: "Accepted",
      id: 2,
    ),
    ChatModel(
      name: "geeeee",
      icon: Icons.person,
      isGroup: false,
      time: "13:30",
      currentMessage: "See you tomorrow!",
      status: "Accepted",
      id: 3,
    ),
    ChatModel(
      name: "bhiii",
      icon: Icons.person,
      isGroup: false,
      time: "13:30",
      currentMessage: "See you tomorrow!",
      status: "Accepted",
      id: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatmodels.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
           sourceChat = chatmodels.removeAt(index);
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> Homescreen(
            chatmodels: chatmodels,
            sourchat: sourceChat,
           )));
          },
          child: ButtonCard(
            name: chatmodels[index].name,
            icon: chatmodels[index].icon, // Pass icon from ChatModel
          ),
        ),
      ),
    );
  }
}
