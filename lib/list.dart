import 'package:flutter/material.dart';

class ListDemo extends StatefulWidget{
  @override
  ListMainApp createState() => ListMainApp();
}

class ListMainApp extends State<ListDemo>{

    List<String> titleArray = [
      "Android", 
      "Java", 
      "Php", 
      "iOS", 
      "Python", 
      "Flutter"
    ];

     List<String> subTitleArray = [
      "Android Description", 
      "Java Description", 
      "Php Description", 
      "iOS Description", 
      "Python Description", 
      "Flutter Description"
    ];

    List<String> imageArray = [
      "Nlogo5.jpg", 
      "Np1.jpg", 
      "Nlogo5.jpg", 
      "Np1.jpg", 
      "Nlogo5.jpg", 
      "Np1.jpg"
    ];

    List<String> trailingArray = [
      "Np1.jpg", 
      "Nlogo5.jpg", 
      "Np1.jpg", 
      "Nlogo5.jpg", 
      "Np1.jpg", 
      "Nlogo5.jpg"
    ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 68, 243, 255),
          title: Text("List Demo", style: TextStyle(color: Colors.black),),
        ),
        body: ListView.builder(
          itemCount: titleArray.length,
          itemBuilder:(BuildContext context, int positions){
            return ListTile(
              title: Text(titleArray[positions]),
              subtitle: Text(subTitleArray[positions]),
              leading: Container(width: 100.0,child: Image.asset("assets/images/${imageArray[positions]}")),
              trailing: Container(width: 100.0,child: Image.asset("assets/images/${trailingArray[positions]}")),
            );
          },
        ),
     )
    );
  }
}