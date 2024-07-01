import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/ButtonCard.dart';
import 'package:whatsapp_clone/CustomUI/ContactCard.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';
import 'package:whatsapp_clone/Screens/CreateGroup.dart';

class SelectContact extends StatefulWidget {
  SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    final List<ChatModel> contacts = [
      ChatModel(name: "Geetha", status: "busy",id: 1),
      ChatModel(name: "Vasthala", status: "running",id: 2),
      ChatModel(name: "Bhavi", status: "busy",id: 3),
      ChatModel(name: "Ifla", status: "smart",id: 4),
       ChatModel(name: "Geetha", status: "busy",id: 5),
      ChatModel(name: "Vasthala", status: "running",id: 6),
      ChatModel(name: "Bhavi", status: "busy",id: 7),
      ChatModel(name: "Ifla", status: "smart",id: 8),
       ChatModel(name: "Geetha", status: "busy",id: 9),
      ChatModel(name: "Vasthala", status: "running",id: 10),
      ChatModel(name: "Bhavi", status: "busy",id: 11),
      ChatModel(name: "Ifla", status: "smart",id: 12),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "256 Contacts",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 26)),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("Invite a friend"),
                  value: "Invite a friend",
                ),
                PopupMenuItem(
                  child: Text("Contacts"),
                  value: "Contacts",
                ),
                PopupMenuItem(
                  child: Text("Refresh"),
                  value: "Refresh",
                ),
                PopupMenuItem(
                  child: Text("Help"),
                  value: "Help",
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2, // Adding 2 for ButtonCard instances
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder)=> CreateGroup()));
              },
              child: ButtonCard(name: "New group", icon: Icons.group));
          } else if (index == 1) {
            return ButtonCard(name: "New contact", icon: Icons.person_add);
          }
          return ContactCard(contact: contacts[index - 2]); // Adjust index for ContactCard
        },
      ),
    );
  }
}
