import 'package:flutter/material.dart';
import 'package:my_app/heroAnimation.dart';
import 'package:my_app/simpleAnimation.dart';

class AnimationList extends StatelessWidget{
    
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationListDemo(),
    );
  }
}

class AnimationListDemo extends StatefulWidget{

  @override
  AnimationListState createState() => AnimationListState();
}

class AnimationListState extends State<AnimationListDemo>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 68, 243, 255),
          title: Text("Animation List",style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 200.0,
                height: 40.0,
                color: Colors.green.shade200,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => HeroAnimation()),);
                  },
                   child: Text("Hero Animation",style: TextStyle(color: Colors.black),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 200.0,
                height: 40.0,
                color: Colors.green.shade200,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => SimpleAnimation()),);
                  },
                   child: Text("Simple Animation",style: TextStyle(color: Colors.black),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}