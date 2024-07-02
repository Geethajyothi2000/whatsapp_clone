import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/StatusPage/HeadOwnStatus.dart';
import 'package:whatsapp_clone/CustomUI/StatusPage/OthersStatus.dart';



class StatusPage extends StatefulWidget {
  StatusPage({required Key key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 225, 238, 246),
              elevation: 8,
              onPressed: (){},
            child: Icon(Icons.edit,color: Colors.blueGrey[900],),
            ),
          ),
          SizedBox(height: 13,),
          FloatingActionButton(onPressed: (){},
          backgroundColor: Colors.greenAccent[700],
          elevation: 5,
          child: Icon(Icons.camera_alt),
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: 10,
            // ),
            HeadOwnStatus(),
            label("Recent Updates"),
            OthersStatus(
              name: "bhii",
              imageName: "assets/2.jpg",
              time: "10:40",
              isSeen: false,
              statusNum: 1,
            ),
            OthersStatus(
              name: "geee",
              imageName: "assets/4.jpg",
              time: "10:40",
              isSeen: false,
              statusNum: 2,
            ),
            OthersStatus(
              name: "sacket",
              imageName: "assets/3.jpg",
              time: "10:40",
              isSeen: false,
              statusNum: 3,
            ),
            SizedBox(
              height: 10,
            ),
             label("Vived Updates"),

             OthersStatus(
              name: "bhii",
              imageName: "assets/2.jpg",
              time: "10:40",
              isSeen: true,
              statusNum: 1,
            ),
            OthersStatus(
              name: "geee",
              imageName: "assets/4.jpg",
              time: "10:40",
              isSeen: true,
              statusNum: 2,
            ),
            OthersStatus(
              name: "sacket",
              imageName: "assets/3.jpg",
              time: "10:40",
              isSeen: true,
              statusNum: 5,
            ),
          ],
        ),
      ),
    );
  }
  Widget label(String labelname){
return Container(
              height: 33,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 170, 161, 161),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 7),
                child: Text(labelname,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
              ),
            );
  }
}
