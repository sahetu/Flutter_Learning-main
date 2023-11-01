import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/SqliteDatabaseHelper.dart';
import 'package:sqflite/sqflite.dart';


// class SqliteList extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     //throw UnimplementedError();
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SqliteListDemo(),
//     );
//   }
// }

class SqliteListState extends StatelessWidget{

  GlobalKey<FormState> formState = GlobalKey();
 late String sName, sEmail, sContact, sPassword;
 var dbHelper = SqliteDatabaseHelper();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 68, 243, 255),
            title: Text("Sqlite Database", style: TextStyle(color: Colors.black, fontSize: 20),),
        ),
        body: SingleChildScrollView(
          child: Container(
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
                               updateMethod(sName, sEmail, sContact, sPassword);
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
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Container(
                      width: 200.0,
                      height: 40.0,
                      color:Color.fromARGB(255, 68, 243, 255) ,
                      child: TextButton(
                        onPressed: () {
                            formState.currentState!.save();
                            deleteMethod(sContact);
                        },
                        child: Text(
                          "Delete", 
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
                            showMethod();
                        },
                        child: Text(
                          "Show", 
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
                            formState.currentState!.save();
                            searchMethod(sContact);
                        },
                        child: Text(
                          "Search", 
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
        ),
      ),
    );
  }
  
  void insertMethod(String sName, String sEmail, String sContact, String sPassword) async {
     Map<String,dynamic> rows = {
      SqliteDatabaseHelper.columnName : sName,
      SqliteDatabaseHelper.columnEmail : sEmail,
      SqliteDatabaseHelper.columnContact : sContact,
      SqliteDatabaseHelper.columnPassword : sPassword
     };

    final id = await dbHelper.insert(rows);
    Fluttertoast.showToast(msg: "Insert Successfully",toastLength: Toast.LENGTH_LONG);
    print('Inserted Row Id : $id');
  }

  void updateMethod(String sName, String sEmail, String sContact, String sPassword) async {
     Map<String,dynamic> map = {
      SqliteDatabaseHelper.columnName : sName,
      SqliteDatabaseHelper.columnEmail : sEmail,
      SqliteDatabaseHelper.columnPassword : sPassword
     };
    var insertedId = await dbHelper.update(map,sContact);
    print('Updated Id : $insertedId');
  }

  void deleteMethod(String sContact) async {
    var insertedId = await dbHelper.delete(sContact);
    print('Deleted Id : $insertedId');
  }

  void showMethod() async {
    var showData = await dbHelper.getAllData();
    for(var i=0;i<showData.length;i++){
      print(showData[i]);
      print(showData[i]['name']);
    }
  }

  void searchMethod(String sContact) async {
    var showData = await dbHelper.getSearchData(sContact);
    for(var i=0;i<showData.length;i++){
      print(showData[i]);
      print(showData[i]['name']);
    }
  }

}