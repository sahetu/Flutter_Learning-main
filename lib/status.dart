import 'package:flutter/material.dart';

class StatusDemo extends StatefulWidget{

  @override
  StatusApp createState() => StatusApp();
}

class StatusApp extends State<StatusDemo>{
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      body: Container(
        color:Colors.green.shade300,
      ),
    );
  }
}