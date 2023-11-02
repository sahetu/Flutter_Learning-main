import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/NavigationDrawerDemo.dart';
import 'package:my_app/jsonLogin.dart';
import 'package:my_app/jsonProfile.dart';
import 'package:my_app/siteConstant.dart';
import 'package:my_app/tabDemo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashState(),
    );
  }
}

class SplashState extends StatefulWidget{

  @override
  SplashApp createState() => SplashApp();
}

class SplashApp extends State<SplashState>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimerMethod();
  }

  Future<Timer> startTimerMethod() async {
    var sp = await SharedPreferences.getInstance();
    return new Timer(Duration(seconds: 3), () { 
      var sId = sp.getString(SiteConstant.USERID) ?? '';
      if(sId == ''){
        Navigator.push(context, MaterialPageRoute(builder: (context) => JsonLoginApp()));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => JsonProfileApp()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 68, 243, 255),
          title: Text("Splash Screen",style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Container(
          child: Image.asset(SiteConstant.STATIC_IMAGE_PATH+"Nlogo5.jpg", width: 150.0,height: 150.0,),
        ),
      ),
    );
  }
}