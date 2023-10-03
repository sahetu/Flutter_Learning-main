import 'package:flutter/material.dart';
import 'package:my_app/SqliteDatabaseHelper.dart';
import 'package:sqflite/sqflite.dart';


class SqliteList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SqliteListDemo(),
    );
  }
}

class SqliteListDemo extends StatefulWidget{
  @override
  SqliteListState createState() => SqliteListState();
}

class SqliteListState extends State<SqliteListDemo>{

  GlobalKey<FormState> formState = GlobalKey();
 late String sName, sEmail, sContact, sPassword;
 var dbHelper = SqliteDatabaseHelper();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 68, 243, 255),
          title: Text("Sqlite Database", style: TextStyle(color: Colors.black, fontSize: 20),),
      ),
      body: Container(
        child: Form(
          key: formState ,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    label: Text("Name"),
                    hintText: "Enter Nmae",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                  ),
                  validator: (nameValue) {
                    if(nameValue!.isEmpty){
                      return "Name Is Requird";
                    }
                  },
                  onSaved: (nameValue) {
                    sName = nameValue!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text("Email Id"),
                    hintText: "Enter Email Id",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                  ),
                   validator: (emailValue) {
                    if(emailValue!.isEmpty){
                      return "Email Id Is Requird";
                    }
                    else if(!RegExp(r"^[a-zA-Z0-9._-]+@[a-z]+\.+[a-z]+").hasMatch(emailValue)){
                           return " Valid Email Id Required";
                        }
                  },
                  onSaved: (emailValue) {
                    sEmail = emailValue!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    label: Text("Contact"),
                    hintText: " Enter Contact No.",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                  ),
                   validator: (contactValue) {
                    if(contactValue!.isEmpty){
                      return "Contact No. Is Requird";
                    }
                    else if(contactValue.length<10){
                      return "Valid Contact No. Requird";
                    }
                  },
                  onSaved: (contactValue) {
                    sContact = contactValue!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text("Password"),
                    hintText: "Enter Passwprd",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                  ),
                   validator: (passwordValue) {
                    if(passwordValue!.isEmpty){
                      return "Password Is Requird";
                    }
                    else if(passwordValue.length<6){
                      return "Min. 6 Character Is Requird";
                    }
                  },
                  onSaved: (passwordValue) {
                    sPassword = passwordValue!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
                  width: 200.0,
                  height: 40.0,
                  color:Color.fromARGB(255, 68, 243, 255) ,
                  child: TextButton(
                    onPressed: () {
                      if(formState.currentState!.validate()){
                           formState.currentState!.save();
                           insertMethod(sName, sEmail, sContact, sPassword);
                      }
                    },
                    child: Text(
                      "Insert", 
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
                  width: 200.0,
                  height: 40.0,
                  color:Color.fromARGB(255, 68, 243, 255) ,
                  child: TextButton(
                    onPressed: () {
                      if(formState.currentState!.validate()){
                           formState.currentState!.save();
                      }
                    },
                    child: Text(
                      "Update", 
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void insertMethod(String sName, String sEmail, String sContact, String sPassword) async {
    await dbHelper.initDatabase();
     Map<String,dynamic> map = {
      'name' : sName,
      'email' : sEmail,
      'contact' : sContact,
      'password' : sPassword,
     };

    var insertedId = dbHelper.insertMethod(map);
    print('Last Inserted Id : $insertedId');


  }
}