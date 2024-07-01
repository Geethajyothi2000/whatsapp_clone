// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/flutter_svg.dart';  // Make sure you have this package in your pubspec.yaml
// import 'package:whatsapp_clone/CustomUI/OwnMessageCard.dart';
// import 'package:whatsapp_clone/CustomUI/ReplyCard.dart';
// import 'package:whatsapp_clone/CustomUI/ReplyCard.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:socket_io_client/socket_io_client.dart' as Io;
// import 'package:whatsapp_clone/Model/ChatModel.dart';
// import 'package:whatsapp_clone/Model/MessageModel.dart';

// class IndividualPage extends StatefulWidget {
//   final ChatModel chatModel;
//   final ChatModel   sourchat;

//   IndividualPage({Key? key, required this.chatModel,required this.sourchat}) : super(key: key);

//   @override
//   _IndividualPageState createState() => _IndividualPageState();
// }

// class _IndividualPageState extends State<IndividualPage> {
//   bool show = false;
//   FocusNode focusNode = FocusNode();
//   late Io.Socket  socket;
//   bool sendButton = false;
//   late List<MessageModel> message= [];
//   TextEditingController _controller = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     connect();
//     focusNode.addListener(() {
//       if (focusNode.hasFocus) {
//         setState(() {
//           show = false;
//         });
//       }
//     });
//     
//   }



//   void connect() {
//     socket = Io.io("http://192.168.0.103:5000",<String,dynamic>{
//       "transports": ["websocket" ],
//       "autoConnect": false,
//     });
//     socket.connect();
//        socket.emit("signin",widget.sourchat.id);
//     socket.onConnect((data){ print("Connected");});
//     print(socket.connected);
//  socket.on("message", (msg)=>{
// print(msg)
//  });
//   }

//   void sendMessage(String message,int sourceId,int targetId) {
// socket.emit("message",{"message":message, "sourceId":sourceId, "targetId":targetId});
//   }

//   @override
//   void dispose() {
//     focusNode.dispose();
//     super.dispose();
//   }

//   Future<void> saveMessage(String message) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('saved_message', message);
//   }

//   Future<void> _loadSavedMessage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedMessage = prefs.getString('saved_message');
//     if (savedMessage != null) {
//       _controller.text = savedMessage;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Image.asset("assets/whatsapp_back.png",
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         fit: BoxFit.cover,
//         ),
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: AppBar(
//             leadingWidth: 70,
//             titleSpacing: 0,
//             leading: InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.arrow_back, size: 24,),
//                   CircleAvatar(
//                     child: SvgPicture.asset(
//                       widget.chatModel.isGroup ? "assets/groups.svg" : "assets/person.svg",
//                       color: Colors.white,
//                       height: 36,
//                       width: 36,
//                     ),
//                     radius: 20,
//                     backgroundColor: Colors.blueGrey,
//                   )
//                 ],
//               ),
//             ),
//             title: InkWell(
//               onTap: () {
//                 // Define the behavior when the title is tapped
//               },
//               child: Container(
//                 margin: EdgeInsets.all(6),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(widget.chatModel.name,style: TextStyle(
//                       fontSize: 18.5,
//                       fontWeight: FontWeight.bold,
//                     ),),
//                     Text("Last Seen today at 12:05",style: TextStyle(
//                       fontSize: 13,
//                     ),)
//                   ],
//                 ),
//               ),
//             ),
//             actions: [
//               IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
//               IconButton(onPressed: () {}, icon: Icon(Icons.call)),
//               PopupMenuButton<String>(
//                 onSelected: (value) {
//                   print(value);
//                 },
//                 itemBuilder: (BuildContext context) {
//                   return [
//                     PopupMenuItem(
//                       child: Text("View Contact"),
//                       value: "View Contact",
//                     ),
//                     PopupMenuItem(
//                       child: Text("media, links and docs"),
//                       value: "media, links and docs",
//                     ),
//                     PopupMenuItem(
//                       child: Text("Whatsapp Web"),
//                       value: "Whatsapp Web",
//                     ),
//                     PopupMenuItem(
//                       child: Text("Search"),
//                       value: "Search",
//                     ),
//                     PopupMenuItem(
//                       child: Text("Mute Notification"),
//                       value: "Mute Notification",
//                     ),
//                     PopupMenuItem(
//                       child: Text("Wallpaper"),
//                       value: "Wallpaper",
//                     ),
//                   ];
//                 },
//               ),
//             ],
//           ),
//           body: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Stack(
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height -140,
//                   child: ListView(
//                     shrinkWrap: true,
//                     children: [
//                       OwnMessageCard(
//                         key: UniqueKey(),  
//                         message: _controller.text,  
//                         time: '10:40',  
//                       ),
                      //  ReplyCard(
                      //   key: UniqueKey(),  
                      //   message: _controller.text,  
                      //   time: '10:40',
                      //  ),
//                     ],
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 width: MediaQuery.of(context).size.width - 60,
//                                 child: Card(
//                                   margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(25),
//                                   ),
//                                   child: TextFormField(
//                                     focusNode: focusNode,
//                                     controller: _controller,
//                                     textAlignVertical: TextAlignVertical.center,
//                                     keyboardType: TextInputType.multiline,
//                                     maxLines: 5,
//                                     minLines: 1,
//                                     onChanged: (value){
//                                       if(value.length > 0){
//                                         setState(() {
//                                           sendButton = true;
//                                         });
//                                       } else {
//                                         setState(() {
//                                           sendButton = false;
//                                         });
//                                       }
//                                     },
//                                     decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       hintText: 'Type a message',
//                                       hintStyle: TextStyle(color: Colors.grey),
//                                       prefixIcon: IconButton(
//                                         icon: Icon(Icons.emoji_emotions_outlined),
//                                         onPressed: () {
//                                           focusNode.unfocus();
//                                           focusNode.canRequestFocus = false;
//                                           setState(() {
//                                             show = !show;
//                                           });
//                                         },
//                                       ),
//                                       suffixIcon: Row(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           IconButton(
//                                             icon: Icon(Icons.attach_file),
//                                             onPressed: () {
//                                               showModalBottomSheet(
//                                                 backgroundColor: Colors.transparent,
//                                                 context: context, 
//                                                 builder: (builder)=>bottomsheet());
//                                             },
//                                           ),
//                                           IconButton(
//                                             icon: Icon(Icons.camera_alt),
//                                             onPressed: () {},
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 bottom: 8,
//                                 right: 5,
//                               ),
//                               child: CircleAvatar(
//                                 radius: 25,
//                                 backgroundColor: Color(0xff075E54),
//                                 child: IconButton(
//                                   onPressed: () {
//                              if(sendButton){
//                               sendMessage(_controller.text, widget.sourchat.id, widget.chatModel.id);
//                               _controller.clear();
//                              }
//                                   },
//                                   icon: Icon( sendButton ? Icons.send : Icons.mic),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       if (show) Container(
//                         height: 250,  // Set a fixed height for the emoji picker
//                         child: emojiSelect(),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget bottomsheet() {
//     return Container(
//       height: 278,
//       width: MediaQuery.of(context).size.width,
//       child: Card(
//         margin: EdgeInsets.all(18),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   iconcreation(Icons.insert_drive_file, Colors.indigo, "Document"),
//                   SizedBox(width: 40),
//                   iconcreation(Icons.camera_alt, Colors.pink, "Camera"),
//                   SizedBox(width: 40),
//                   iconcreation(Icons.insert_photo, Colors.purple, "Gallery"),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   iconcreation(Icons.headset, Colors.orange, "Audio"),
//                   SizedBox(width: 40),
//                   iconcreation(Icons.location_pin, Colors.green, "Location"),
//                   SizedBox(width: 40),
//                   iconcreation(Icons.person, Colors.blue, "Contact"),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget iconcreation(IconData icon, Color color, String text) {
//     return InkWell(
//       onTap: () {
//         // Add your onTap functionality here
//       },
//       child: Column(
//         children: [
//           CircleAvatar(
//             radius: 30,
//             backgroundColor: color,
//             child: Icon(
//               icon,
//               size: 29,
//               color: Colors.white,
//             ),
//           ),
//           SizedBox(height: 5),
//           Text(
//             text,
//             style: TextStyle(
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//    Widget emojiSelect() {
//     return EmojiPicker(
//       onEmojiSelected: (emoji, category) {
//         print(emoji);
//         setState(() {
//           var emoji;
//           _controller.text = _controller.text + emoji!.emoji;
//         });
//       },
//     );
//   }
// }































// import 'package:camera/camera.dart';
// import 'package:chatapp/CustomUI/CameraUI.dart';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';  // Make sure you have this package in your pubspec.yaml
import 'package:whatsapp_clone/CustomUI/OwnMessageCard.dart';
import 'package:whatsapp_clone/CustomUI/ReplyCard.dart';
import 'package:whatsapp_clone/CustomUI/ReplyCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;
import 'package:whatsapp_clone/Model/ChatModel.dart';
import 'package:whatsapp_clone/Model/MessageModel.dart';

class IndividualPage extends StatefulWidget {
  final ChatModel chatModel;
  final ChatModel   sourchat;

  IndividualPage({Key? key, required this.chatModel,required this.sourchat}) : super(key: key);

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  late Io.Socket  socket;
  bool sendButton = false;
  late List<MessageModel> message= [];
   ScrollController _scrollController = ScrollController();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
     connect(); 
  }

  void connect() {
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
    socket = Io.io("http://192.168.0.103:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("signin", widget.sourchat.id);
    socket.onConnect((data) {
      print("Connected");
      socket.on("message", (msg) {
        print(msg);
        setMessage("destination", msg["message"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    print(socket.connected);
  }

  void sendMessage(String messages, int sourceId, int targetId) {
    setMessage("source", messages);
    socket.emit("message",
        {"message": messages, "sourceId": sourceId, "targetId": targetId});
  }

  void setMessage(String type, String messages) {
  MessageModel messageModel = MessageModel(
    type: type,
    message: messages,
    time: DateTime.now().toString().substring(10, 16),
  );

  setState(() {
    message.add(messageModel);
  });
}


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/whatsapp_back.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              leadingWidth: 70,
              titleSpacing: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                    CircleAvatar(
                      child: SvgPicture.asset(
                        widget.chatModel.isGroup
                            ? "assets/groups.svg"
                            : "assets/person.svg",
                        color: Colors.white,
                        height: 36,
                        width: 36,
                      ),
                      radius: 20,
                      backgroundColor: Colors.blueGrey,
                    ),
                  ],
                ),
              ),
              title: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.chatModel.name,
                        style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "last seen today at 12:05",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
                IconButton(icon: Icon(Icons.call), onPressed: () {}),
                PopupMenuButton<String>(
                  padding: EdgeInsets.all(0),
                  onSelected: (value) {
                    print(value);
                  },
                  itemBuilder: (BuildContext contesxt) {
                    return [
                      PopupMenuItem(
                        child: Text("View Contact"),
                        value: "View Contact",
                      ),
                      PopupMenuItem(
                        child: Text("Media, links, and docs"),
                        value: "Media, links, and docs",
                      ),
                      PopupMenuItem(
                        child: Text("Whatsapp Web"),
                        value: "Whatsapp Web",
                      ),
                      PopupMenuItem(
                        child: Text("Search"),
                        value: "Search",
                      ),
                      PopupMenuItem(
                        child: Text("Mute Notification"),
                        value: "Mute Notification",
                      ),
                      PopupMenuItem(
                        child: Text("Wallpaper"),
                        value: "Wallpaper",
                      ),
                    ];
                  },
                ),
              ],
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Column(
                children: [
                 Expanded(
  child: ListView.builder(
    shrinkWrap: true,
    controller: _scrollController,
    itemCount: message.length + 1,
    itemBuilder: (context, index) {
      if (index == message.length) {
        return Container(
          height: 70,
        );
      }
      if (message[index].type == "source") {
        return OwnMessageCard(
          key: UniqueKey(),
          message: message[index].message,
          time: message[index].time,
        );
      } else {
        return ReplyCard(
          key: UniqueKey(),
          message: message[index].message,
          time: message[index].time,
        );
      }
    },
  ),
),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Card(
                                  margin: EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: TextFormField(
                                    controller: _controller,
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    onChanged: (value) {
                                      if (value.length > 0) {
                                        setState(() {
                                          sendButton = true;
                                        });
                                      } else {
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      prefixIcon: IconButton(
                                        icon: Icon(
                                          show
                                              ? Icons.keyboard
                                              : Icons.emoji_emotions_outlined,
                                        ),
                                        onPressed: () {
                                          if (!show) {
                                            focusNode.unfocus();
                                            focusNode.canRequestFocus = false;
                                          }
                                          setState(() {
                                            show = !show;
                                          });
                                        },
                                      ),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.attach_file),
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (builder) =>
                                                      bottomSheet());
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.camera_alt),
                                            onPressed: () {
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (builder) =>
                                              //             CameraApp()));
                                            },
                                          ),
                                        ],
                                      ),
                                      contentPadding: EdgeInsets.all(5),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 8,
                                  right: 5,
                                  left: 2,
                                ),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Color(0xFF128C7E),
                                  child: IconButton(
                                    icon: Icon(
                                      sendButton ? Icons.send : Icons.mic,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (sendButton) {
                                        _scrollController.animateTo(
                                            _scrollController
                                                .position.maxScrollExtent,
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeOut);
                                        sendMessage(
                                            _controller.text,
                                            widget.sourchat.id,
                                            widget.chatModel.id);
                                        _controller.clear();
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          show ? emojiSelect() : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.location_pin, Colors.teal, "Location"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }
Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (emoji, category) {
        print(emoji);
        setState(() {
          var emoji;
          _controller.text = _controller.text + emoji!.emoji;
        });
      },
    );
  }
  
}
