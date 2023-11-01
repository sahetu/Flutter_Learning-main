
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/home.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/jsonProfile.dart';
import 'package:my_app/jsonSignup.dart';
import 'package:my_app/siteConstant.dart';

class JsonLoginApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JsonLoginStatefulApp(),
    );
  }
}

class JsonLoginStatefulApp extends StatefulWidget{
  @override
  JsonLoginAppState createState() => JsonLoginAppState();
}

class JsonLoginAppState extends State<JsonLoginStatefulApp>{

  GlobalKey<FormState> formkey = new GlobalKey();
    late String sEmail,sPassword;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Amble'),
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 68, 243, 255),
          title: Text("Login", style: TextStyle(color: Colors.black, fontSize: 20),),
          leading: IconButton(
            onPressed: (){
              print("Back Event Click");
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                        
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10,10,10,0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email),
                          ),
                          validator: (emailinput) {
                          if(emailinput!.isEmpty || emailinput == ""){
                            return "Email Id Required";
                          } 
                            else if(!RegExp(r"^[a-zA-Z0-9._-]+@[a-z]+\.+[a-z]+").hasMatch(emailinput)){
                              return " Valid Email Id Required";
                            }
                          
                          else {
                            return null;
                          }
                        },
                        onSaved: (emailInput) {
                          sEmail= emailInput!;
                        },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,10,10,0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius:BorderRadius.circular(5)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                          ),
                          validator: (passwordinput) {
                            if(passwordinput!.isEmpty || passwordinput == ""){
                              return "Password is Required";
                            }
                              else if (passwordinput.length<6){
                                  return "Min. 6 Character Requird In Password";
                              }
                            
                              else {
                              return null;
                            }
                          },
                          onSaved: (passwordInput) {
                            sPassword= passwordInput!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30.0),
                        child: Container(
                          color:Color.fromARGB(255, 68, 243, 255),
                          width: 150.0,
                          height: 40.0,
                          child: Center(
                            child: TextButton(
                              onPressed:() async {
                                  if(formkey.currentState!.validate()){
                                    formkey.currentState!.save();
                                    var connectivity = await(Connectivity().checkConnectivity());
                                    if(connectivity == ConnectivityResult.wifi || connectivity == ConnectivityResult.mobile){
                                      LoginData(sEmail,sPassword);
                                    }
                                    else{
                                      Fluttertoast.showToast(
                                      gravity: ToastGravity.BOTTOM,
                                      msg:'Internet/Wifi Disconnected', 
                                      toastLength: Toast.LENGTH_LONG);
                                    }
                                      // Fluttertoast.showToast(
                                      // gravity: ToastGravity.CENTER,
                                      // msg:'Signup Successfully', 
                                      // toastLength: Toast.LENGTH_LONG);
                                }
                              },
                              child: Text(
                                "Login", 
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 17.0),
                              
                              ),
                              ),
                          ),
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30.0),
                        child: Container(
                          color:Color.fromARGB(255, 68, 243, 255),
                          width: 150.0,
                          height: 40.0,
                          child: Center(
                            child: TextButton(
                              onPressed:() async {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => JsonSignupApp()));
                              },
                              child: Text(
                                "Signup", 
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 17.0),
                              
                              ),
                              ),
                          ),
                          ),
                      ),
                    ],

                )
                )
                
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  LoginData(String sEmail, String sPassword) async {
    var map = {
      "email" : sEmail,
      "password" : sPassword
    };

    var data = await http.post(Uri.parse(SiteConstant.LOGIN_URL),body: map);
    if(data.statusCode==200){
      var jsonData = jsonDecode(data.body);
      if(jsonData["status"] == true){
        Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        msg:jsonData["message"], 
        toastLength: Toast.LENGTH_LONG);

        Navigator.push(context, MaterialPageRoute(builder: (_) => JsonProfileApp()));

      }
      else{
        Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        msg:jsonData["message"], 
        toastLength: Toast.LENGTH_LONG);
      }
    }
    else{
      Fluttertoast.showToast(
      gravity: ToastGravity.BOTTOM,
      msg:'Server Error Code : ${data.statusCode}', 
      toastLength: Toast.LENGTH_LONG);
    }

  }
}