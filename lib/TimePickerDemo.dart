import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TimePickerDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimePickerState(),
    );
  }
}

class TimePickerState extends StatefulWidget{

  @override
  TimePickerApp createState() => TimePickerApp();
}

class TimePickerApp extends State<TimePickerState>{
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 68, 243, 255),
          title: Text("Time Picker Demo",style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        child: TextButton(
          onPressed: () {

          },
           child: Text("Select Time")
        ),
      ),
    );
  }

}