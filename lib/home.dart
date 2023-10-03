import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget{

  String sEmail,sPassword;

    HomePage(this.sEmail,this.sPassword);

  @override
  HomePageMain createState() => HomePageMain();
}

class HomePageMain extends State<HomePage>{
  int iRadioGroup = 3;
  bool androidCheck = false;
  bool javaCheck = false;
  bool phpCheck = false;
  bool iOSCheck = false;
  
  List<String> technologyArray= [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 68, 243, 255),
          title: Text("Home Page",style: TextStyle(color: Colors.black),),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                     Container(
                      width: 100.0,
                      height: 30.0,
                      color:Color.fromARGB(255, 68, 243, 255),
                      child: Center(child: Text('Emai Id'))),
                     Padding(
                       padding: const EdgeInsets.only(left: 10.0),
                       child: Text(widget.sEmail),
                     ),
                  ],
                ),
              ),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Row(
                  children: [
                     Container(
                      width: 100.0,
                      height: 30.0,
                      color:Color.fromARGB(255, 68, 243, 255),
                      child: Center(child: Text('Password'))),
                     Padding(
                       padding: const EdgeInsets.only(left: 10.0),
                       child: Text(widget.sPassword),
                     ),
                 ],
                ),
              ),
              Row(
                children: [
                    Radio(value: 0, groupValue: iRadioGroup, onChanged: (value) {
                      setState(() {
                        setGender(value,"Male");
                      });
                    }),
                    Text("Male"),

                    Radio(value: 1, groupValue: iRadioGroup, onChanged: (value) {
                      setState(() {
                        setGender(value,"Female");
                      });
                    }),
                    Text("Female"),

                    Radio(value: 2, groupValue: iRadioGroup, onChanged: (value) {
                      setState(() {
                        setGender(value,"Transgender");
                      });
                    }),
                    Text("Transgender")
                ],
              ),
              Row(
                children: [
                  Checkbox(value: androidCheck, 
                    onChanged: (value) {
                    setState(() {
                      androidCheck = value!;
                      technologyMethod(value,"Android");
                    });
                  }),
                  Text("Android")
                ],
              ),
              Row(
                children: [
                  Checkbox(value: javaCheck, 
                    onChanged: (value) {
                    setState(() {
                      javaCheck = value!;
                      technologyMethod(value,"java");
                    });
                  }),
                  Text("java")
                ],
              ),
              Row(
                children: [
                  Checkbox(value: phpCheck, 
                    onChanged: (value) {
                    setState(() {
                      phpCheck = value!;
                      technologyMethod(value,"php");
                    });
                  }),
                  Text("php")
                ],
              ),
              Row(
                children: [
                  Checkbox(value: iOSCheck, 
                    onChanged: (value) {
                    setState(() {
                      iOSCheck = value!;
                      technologyMethod(value,"iOS");
                    });
                  }),
                  Text("iOS")
                ],
              )
            ],
          ),
        ),
        ),
    );
  }
 
 void setGender(value,selectedGender) {
  iRadioGroup = value;
  Fluttertoast.showToast(msg:selectedGender, toastLength: Toast.LENGTH_LONG);
 }

 technologyMethod(isSelect,message){
  if(isSelect){
    technologyArray.add(message);
  }
  else{
    technologyArray.removeWhere((element) => element == message);
  }
  print(technologyArray);
 }
}


