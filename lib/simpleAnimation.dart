import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SimpleAnimation extends StatefulWidget{

  @override
  SimpleAnimationApp createState() => SimpleAnimationApp();
}

class SimpleAnimationApp extends State<SimpleAnimation>{

  MovieTween TweenAnimation = MovieTween()
                        ..scene(
                              begin: Duration(milliseconds: 0), 
                              duration: Duration(milliseconds:1500 ))
                              .tween('width', Tween(begin: 0.0,end: 200.0))
                        ..scene(
                              begin: Duration(milliseconds: 1500), 
                              duration: Duration(milliseconds:3000 ))
                              .tween('width', Tween(begin: 200.0,end: 400.0))
                        ..scene(
                              begin: Duration(milliseconds: 0), 
                              duration: Duration(milliseconds:1500 ))
                              .tween('height', Tween(begin: 0.0,end: 200.0))
                        ..scene(
                              begin: Duration(milliseconds:1500), 
                              duration: Duration(milliseconds:3000 ))
                              .tween('height', Tween(begin: 200.0,end: 400.0))
                        ..scene(
                              begin: Duration(milliseconds: 0), 
                              duration: Duration(milliseconds:3000 ))
                              .tween('color', ColorTween(begin: Colors.blue,end: Colors.amber))
                        ..scene(
                              begin: Duration(milliseconds: 0), 
                              duration: Duration(milliseconds:3000 ))
                              .tween('textsize', Tween(begin: 0.0,end: 100.0))
                        ..scene(
                              begin: Duration(milliseconds: 0), 
                              duration: Duration(milliseconds:3000 ))
                              .tween('textcolor', ColorTween(begin: Colors.white,end: Colors.black));

MovieTween reversTweenAnimation = MovieTween()
                        ..scene(
                              begin: Duration(milliseconds: 0), 
                              duration: Duration(milliseconds:1500 ))
                              .tween('width', Tween(begin: 400.0,end: 200.0))
                        ..scene(
                              begin: Duration(milliseconds: 1500), 
                              duration: Duration(milliseconds:3000 ))
                              .tween('width', Tween(begin: 200.0,end: 0.0))
                        ..scene(
                              begin: Duration(milliseconds: 0), 
                              duration: Duration(milliseconds:1500 ))
                              .tween('height', Tween(begin: 400.0,end: 200.0))
                        ..scene(
                              begin: Duration(milliseconds:1500), 
                              duration: Duration(milliseconds:3000 ))
                              .tween('height', Tween(begin: 200.0,end: 0.0))
                        ..scene(
                              begin: Duration(milliseconds: 0), 
                              duration: Duration(milliseconds:3000 ))
                              .tween('color', ColorTween(begin: Colors.amber,end: Colors.blue))
                        ..scene(
                              begin: Duration(milliseconds: 0), 
                              duration: Duration(milliseconds:3000 ))
                              .tween('textsize', Tween(begin: 100.0,end: 0.0))
                        ..scene(
                              begin: Duration(milliseconds: 0), 
                              duration: Duration(milliseconds:3000 ))
                              .tween('textcolor', ColorTween(begin: Colors.black,end: Colors.white));

                              

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 68, 243, 255),
          title: Text("Simple Animation ",style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        child: Row(
          children: [
            PlayAnimationBuilder(
              tween: TweenAnimation, 
              duration: TweenAnimation.duration, 
              builder: (context,value,child) {
                return Container(
                  width:value.get('width'),
                  height:value.get('height'),
                  color:value.get('color'),
                  child: Container(child: Center(
                    child: Text(
                      'Hello!', 
                      style: TextStyle(fontSize: value.get('textsize'),
                      color: value.get('textcolor'),
                      ),
                    ),
                  )),
                );
              }
            ),
            PlayAnimationBuilder(
              tween: reversTweenAnimation, 
              duration: reversTweenAnimation.duration, 
              builder: (context,value,child) {
                return Container(
                  width:value.get('width'),
                  height:value.get('height'),
                  color:value.get('color'),
                  child: Container(child: Center(
                    child: Text(
                      'Hello!', 
                      style: TextStyle(fontSize: value.get('textsize'),
                      color: value.get('textcolor'),
                      ),
                    ),
                  )),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}