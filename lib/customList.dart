import 'package:flutter/material.dart';
import 'package:my_app/siteConstant.dart';

class CustomList extends StatefulWidget {

  @override
  CustomListMain createState() => CustomListMain();
}

class CustomListMain extends State<CustomList>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 68, 243, 255),
          title: Text("Custom List",style: TextStyle(color: Colors.black),),
        ),
        body: Container(
          child: CustomListDesign(),
        ),
      ),
    );
  }
}


class CustomListDesign extends StatelessWidget{

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

    List<String> priceArray = [
      "1000", 
      "1500", 
      "1200", 
      "2000", 
      "2500", 
      "3000"
    ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return ListView.builder(
      itemCount: imageArray.length,
      itemBuilder: (context, index){
         return Padding(
           padding: const EdgeInsets.all(5.0),
           child: Card(
            elevation: 5.0,
            color: Color.fromARGB(252, 69, 245, 134),
            child: Row(
              children: [
                Image.asset("assets/images/${imageArray[index]}",width: 100.0,height: 100.0,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: [
                      Text(titleArray[index], 
                          style: TextStyle(color: Colors.black, 
                          fontSize: 20.0, 
                          fontWeight: FontWeight.bold),),
                      Text(subTitleArray[index],
                          style: TextStyle(color: Colors.black, 
                          fontSize: 16.0,)),
                      Text(
                           SiteConstant.PRICE_SYMBOL+priceArray[index],
                          style: TextStyle(color: Colors.black, 
                          fontSize: 16.0, 
                          fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ],
            ),
           ),
         );
      });
  }
}