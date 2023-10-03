import 'package:flutter/material.dart';
import 'package:my_app/call.dart';
import 'package:my_app/chat.dart';
import 'package:my_app/status.dart';

class TabDemo extends StatefulWidget{

  @override
  TabApp createState() => TabApp();
}

class TabApp extends State<TabDemo> with SingleTickerProviderStateMixin{

  late TabController tabController;

  var tabArray = [ChatDemo(),StatusDemo(),CallDemo()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: tabArray.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 68, 243, 255),
          title: Text("Tab Demo",style: TextStyle(color: Colors.black),),
          bottom: getTab(),
        ),
        body: getTabView(),
      ),
    );
  }
  getTab(){
    return TabBar(
      tabs: [
        Tab(
          text: "Chat",
        ),
        Tab(
          text: "Status",
        ),
        Tab(
          text: "Call",
        ),
      ],
      unselectedLabelColor: Colors.black54,
      labelColor: Colors.black,
      controller: tabController,
      indicatorColor: Colors.black,
      );
  }


  getTabView() {
    return TabBarView(
      children:tabArray ,
      controller: tabController,
    );
  }


}