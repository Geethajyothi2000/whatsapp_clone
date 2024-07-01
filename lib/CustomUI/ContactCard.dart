import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 25,
              child: SvgPicture.asset(
                "assets/person.svg",
                height: 30,
                width: 30,
              ),
              backgroundColor: Colors.blueGrey[500],
            ),
            contact.select ? Positioned(
              bottom: 4,
              right: 5,
              child: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 8,
                child: Icon(Icons.check, color: Colors.white, size: 18),
              ),
            ) : Container(),
          ],
        ),
      ),
      title: Text(
        contact.name,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        contact.status,
        style: TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
