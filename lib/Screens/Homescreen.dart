import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';
import 'package:whatsapp_clone/pages/CameraPage.dart';
import 'package:whatsapp_clone/pages/ChatPage.dart';
import 'package:whatsapp_clone/pages/StatusPage.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key? key, required this.chatmodels, required this.sourchat}) : super(key: key);
  final List<ChatModel> chatmodels;
  final ChatModel   sourchat;

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whatsapp Clone"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("New group"),
                  value: "New group",
                ),
                PopupMenuItem(
                  child: Text("New broadcast"),
                  value: "New broadcast",
                ),
                PopupMenuItem(
                  child: Text("Whatsapp Web"),
                  value: "Whatsapp Web",
                ),
                PopupMenuItem(
                  child: Text("Starred message"),
                  value: "Starred message",
                ),
                PopupMenuItem(
                  child: Text("Settings"),
                  value: "Settings",
                ),
              ];
            },
          ),
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          CameraPage(),
          ChatPage(chatmodels: widget.chatmodels,sourchat: widget.sourchat,), // Pass the chatmodels list to ChatPage
         StatusPage(key: Key('status_page')),

          Center(child: Text("Calls")),
        ],
      ),
    );
  }
}
