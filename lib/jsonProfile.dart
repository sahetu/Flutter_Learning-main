
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/home.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/jsonLogin.dart';

class JsonProfileApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JsonProfileStatefulApp(),
    );
  }
}

class JsonProfileStatefulApp extends StatefulWidget{
  @override
  JsonProfileAppState createState() => JsonProfileAppState();
}

class JsonProfileAppState extends State<JsonProfileStatefulApp>{

  GlobalKey<FormState> formkey = new GlobalKey();
    late String sName,sEmail,sContact,sPassword;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Amble'),
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 68, 243, 255),
          title: Text("Profile", style: TextStyle(color: Colors.black, fontSize: 20),),
          leading: IconButton(
            onPressed: (){
              print("Back Event Click");
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Container(
        ),
      ),
    );
  }
  
}