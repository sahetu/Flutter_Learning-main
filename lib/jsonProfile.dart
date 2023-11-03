
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/home.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/jsonLogin.dart';
import 'package:my_app/siteConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JsonProfileApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JsonProfileStatefulApp(),
    );
  }
}

class JsonProfileStatefulApp extends StatefulWidget{
  @override
  JsonProfileAppState createState() => JsonProfileAppState();
}

class JsonProfileAppState extends State<JsonProfileStatefulApp>{

  File? imageFile;
  GlobalKey<FormState> formkey = new GlobalKey();
  late String sId,sName,sEmail,sContact,sPassword;
  var nameController,emailController,contactController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  setData() async{
    var sp = await SharedPreferences.getInstance();
    setState(() {
      sId = sp.getString(SiteConstant.USERID) ?? '';
      sName = sp.getString(SiteConstant.NAME) ?? '';
      sEmail = sp.getString(SiteConstant.EMAIL) ?? '';
      sContact = sp.getString(SiteConstant.CONTACT) ?? '';

      nameController = TextEditingController(text: sName);
      emailController = TextEditingController(text: sEmail);
      contactController = TextEditingController(text: sContact);
    });
  }

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
          title: Text("Profile", style: TextStyle(color: Colors.black, fontSize: 20),),
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
                        GestureDetector(
                          onTap: () {
                            //openGallery();
                            showAlertDialog(context);
                            //Fluttertoast.showToast(msg: "Image Clicked",toastLength: Toast.LENGTH_SHORT);
                          },
                          child: imageFile==null ? Image.asset(SiteConstant.STATIC_IMAGE_PATH+"Nlogo5.jpg",width: 100,height: 100,fit: BoxFit.cover):Image.file(imageFile!,width: 100,height: 100,fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10,10,10,0),
                          child: TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                            labelText: "Name",
                            prefixIcon: Icon(Icons.verified_user),
                          ),
                          validator: (nameinput) {
                          if(nameinput!.isEmpty || nameinput == ""){
                            return "Name Required";
                          } 
                          else {
                            return null;
                          }
                        },
                        onSaved: (nameInput) {
                          sName= nameInput!;
                        },
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10,10,10,0),
                          child: TextFormField(
                            controller: emailController,
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
                            controller: contactController,
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                            labelText: "Contact No.",
                            prefixIcon: Icon(Icons.phone),
                          ),
                          validator: (contactinput) {
                          if(contactinput!.isEmpty || contactinput == ""){
                            return "Contact No. Required";
                          } 
                            else if(contactinput.length<10){
                              return " Valid Contact No. Required";
                            }
                          
                          else {
                            return null;
                          }
                        },
                        onSaved: (contactInput) {
                          sContact= contactInput!;
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
                                      UpdateData(imageFile,sId,sName,sEmail,sContact,sPassword);
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
                                "Update Profile", 
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
                                var sp = await SharedPreferences.getInstance();
                                //sp.remove(SiteConstant.EMAIL);
                                sp.clear();
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>JsonLoginApp()));
                              },
                              child: Text(
                                "Logout", 
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

  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Camera"),
      onPressed:  () {
        openCamera();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Gallery"),
      onPressed:  () {
        openGallery();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Select Application"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  openGallery() async{
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedFile!=null){
      setState(() {
          imageFile = File(pickedFile!.path);
      });
    }
  }
  
  openCamera() async{
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if(pickedFile!=null){
      setState(() {
          imageFile = File(pickedFile!.path);
      });
    }
  }

  UpdateData(File? imageFile,String sId,String sName, String sEmail, String sContact, String sPassword) async {
    var sp = await SharedPreferences.getInstance();
    var map = {
      "id" : sId,
      "name" : sName,
      "email" : sEmail,
      "contact" : sContact,
      "password" : sPassword
    };

    if(imageFile==null){
      var data = await http.post(Uri.parse(SiteConstant.UPDATE_PROFILE_URL),body: map);
      if(data.statusCode==200){
        var jsonData = jsonDecode(data.body);
        if(jsonData["status"] == true){
          Fluttertoast.showToast(
          gravity: ToastGravity.BOTTOM,
          msg:jsonData["message"], 
          toastLength: Toast.LENGTH_LONG);

          sp.setString(SiteConstant.NAME, sName);
          sp.setString(SiteConstant.EMAIL, sEmail);
          sp.setString(SiteConstant.CONTACT, sContact);

          Navigator.push(context, MaterialPageRoute(builder: (_)=> JsonProfileApp()));

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
    else{
      var length = await imageFile.length();
      Map<String,String> headerData = {"Accept":"application/json"};
      http.MultipartRequest request = http.MultipartRequest("POST", Uri.parse(SiteConstant.UPDATE_PROFILE_IMAGE_URL))
      ..headers.addAll(headerData)
      ..fields.addAll(map)
      ..files.add(http.MultipartFile('profileImage',imageFile.openRead(),length,filename: '$sName.jpg'));

      var data = await http.Response.fromStream(await request.send());
      if(data.statusCode==200){
        var jsonData = jsonDecode(data.body);
        if(jsonData["status"] == true){
          Fluttertoast.showToast(
          gravity: ToastGravity.BOTTOM,
          msg:jsonData["message"], 
          toastLength: Toast.LENGTH_LONG);

          sp.setString(SiteConstant.NAME, sName);
          sp.setString(SiteConstant.EMAIL, sEmail);
          sp.setString(SiteConstant.CONTACT, sContact);

          Navigator.push(context, MaterialPageRoute(builder: (_)=> JsonProfileApp()));

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
}