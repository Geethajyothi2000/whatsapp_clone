import 'package:flutter/material.dart';// Corrected spelling
import 'package:whatsapp_clone/CustomUI/AvtarCard.dart';
import 'package:whatsapp_clone/CustomUI/ButtonCard.dart';
import 'package:whatsapp_clone/CustomUI/ContactCard.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';

class CreateGroup extends StatefulWidget {
  CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  final List<ChatModel> contacts = [
    ChatModel(name: "Geetha", status: "busy", id: 1),
    ChatModel(name: "Vasthala", status: "running", id: 2),
    ChatModel(name: "Bhavi", status: "busy", id: 3),
    ChatModel(name: "Ifla", status: "smart", id: 4),
    ChatModel(name: "Geetha", status: "busy", id: 5),
    ChatModel(name: "Vasthala", status: "running", id: 6),
    ChatModel(name: "Bhavi", status: "busy", id: 7),
    ChatModel(name: "Ifla", status: "smart", id: 8),
    ChatModel(name: "Geetha", status: "busy", id: 9),
    ChatModel(name: "Vasthala", status: "running", id: 10),
    ChatModel(name: "Bhavi", status: "busy", id: 11),
    ChatModel(name: "Ifla", status: "smart", id: 12),
  ];
  
  final List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Add Participants",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 26)),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: contacts.length + 1, // Adding 1 for ButtonCard instances
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: groups.isNotEmpty ? 90 : 10,
                );
              }
              return InkWell(
                onTap: () {
                  setState(() {
                    contacts[index - 1].select = !contacts[index - 1].select;
                    if (contacts[index - 1].select) {
                      groups.add(contacts[index - 1]);
                    } else {
                      groups.remove(contacts[index - 1]);
                    }
                  });
                },
                child: ContactCard(contact: contacts[index - 1]), // Adjust index for ContactCard
              );
            },
          ),
          if (groups.isNotEmpty)
            Column(
              children: [
                Container(
                  height: 75,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      if (contacts[index].select) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              contacts[index].select = false;
                              groups.remove(contacts[index]);
                            });
                          },
                          child: AvatarCard(contact: contacts[index]),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                Divider(thickness: 1),
              ],
            ),
        ],
      ),
    );
  }
}
