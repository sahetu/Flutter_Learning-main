import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/siteConstant.dart';

class NavigationDemo extends StatefulWidget{

  @override
  NavigationDemoState createState() => NavigationDemoState();
}

class NavigationDemoState extends State<NavigationDemo>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 68, 243, 255),
          title: Text("Navigation Drawer",style: TextStyle(color: Colors.black),),
        ),
        drawer: Drawer(
          child: new ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Naimish Pambhar"), 
                accountEmail: Text("naimishpambhar@gmail.com"),
                currentAccountPicture: Icon(Icons.supervised_user_circle),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(SiteConstant.NAV_HOME),
                onTap: () {
                  showMessage(SiteConstant.NAV_HOME);
                },
              ),
              ListTile(
                leading: Icon(Icons.category),
                title: Text(SiteConstant.NAV_CATEGORY),
                onTap: () {
                  showMessage(SiteConstant.NAV_CATEGORY);
                },
              ),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text(SiteConstant.NAV_CHANGE_PASS),
                onTap: () {
                  showMessage(SiteConstant.NAV_CHANGE_PASS);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(SiteConstant.NAV_LOGOUT),
                onTap: () {
                  showMessage(SiteConstant.NAV_LOGOUT);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  showMessage(var selectedoption){
    Fluttertoast.showToast(
      msg: selectedoption,toastLength: Toast.LENGTH_SHORT);
  }
}