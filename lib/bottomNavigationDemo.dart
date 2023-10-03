import 'package:flutter/material.dart';
import 'package:my_app/call.dart';
import 'package:my_app/chat.dart';
import 'package:my_app/status.dart';

class BottomDemo extends StatefulWidget{

  @override
  BottomState createState() => BottomState();
}

class BottomState extends State<BottomDemo>{

  var tabPage = [ChatDemo(),StatusDemo(),CallDemo()];

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 68, 243, 255),
          title: Text("Bottom Navigation Demo",style: TextStyle(color: Colors.black),),
        ),
        body:tabPage[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.verified_user_sharp), label: "Profile"),
          ],
          currentIndex:selectedIndex ,
          selectedItemColor: Colors.black,
          onTap: (index){
           ClickMehod(index);
          },
       ),
      ),
    );
  }

  ClickMehod(var index){
    setState(() {
      selectedIndex = index;
    });
  }
}