import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Define the action to take on tap
        print('Contact card tapped!');
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          child: SvgPicture.asset(
            "assets/person.svg",
            height: 30,
            width: 30,
          ),
          backgroundColor: Colors.blueGrey[500],
        ),
        title: Text(
          "Geetha",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "busy",
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
