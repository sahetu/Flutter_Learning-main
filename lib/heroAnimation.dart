import 'package:flutter/material.dart';

class HeroAnimation extends StatefulWidget{

  @override
  HeroAnimationApp createState() => HeroAnimationApp();
}

class HeroAnimationApp extends State<HeroAnimation>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 68, 243, 255),
          title: Text("Hero Animation ",style: TextStyle(color: Colors.black),),
      ),
      body: Container(),
    );
  }
}