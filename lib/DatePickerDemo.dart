import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class DatePickerDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DatePickerState(),
    );
  }
}

class DatePickerState extends StatefulWidget{

  @override
  DatePickerApp createState() => DatePickerApp();
}

class DatePickerApp extends State<DatePickerState>{
  
  String selectedValue = "Select Value";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 68, 243, 255),
          title: Text("Date Picker Demo",style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        child: TextButton(
          onPressed: () {
              DatePicker.showDatePicker(
                context,
                currentTime: DateTime.now(),
                maxTime: DateTime(2024,12,31),
                minTime: DateTime(2000,01,01),
                onCancel: () {
                  print("Cancel Mathod Call");
                },
                onChanged: (changeValue) {
                  setState(() {
                    selectedValue = "Change Mathod Call : $changeValue";
                     print("Change Mathod Call : $changeValue");
                  });
                },
                onConfirm: (confrimValue) {
                  setState(() {
                    selectedValue = "Confrim Mathod Call : $confrimValue";
                    print("Confrim Mathod Call : $confrimValue");
                  });
                }
              );
          }, 
          child: Text(selectedValue)
        ),
      ),
    );
  }
}