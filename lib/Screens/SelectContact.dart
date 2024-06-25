import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/ContactCard.dart';


class SelectContact extends StatefulWidget {
  SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<String> contacts = ["Alice", "Bob", "Charlie", "David", "Eve"]; // Example contacts

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Select Contact",style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),),
          Text("256 Contacts",style: TextStyle(
            fontSize: 13,
          ))
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search,size: 26,)),
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
     body: ListView(
      children: [
        ContactCard(),
      ],
     ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SelectContact(),
  ));
}
