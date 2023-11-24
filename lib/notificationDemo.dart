import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationMainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return NotificationDemo();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return NotificationDemo();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return NotificationDemo();
      },
    );
  }
}

class NotificationDemo extends StatefulWidget{

  @override
  MyAppState createState() => MyAppState();

}

class MyAppState extends State<NotificationDemo>{

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  String fcmToken = "Getting Firebase Token";

  @override
  void initState() {
    Firebase.initializeApp();
    // TODO: implement initState
    requestingPermissionIos();

    var initializationSettingAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    super.initState();
    Firebase.initializeApp().whenComplete(() { 
      print("completed");
      setState(() {});
    });

    FirebaseMessaging.onMessage.listen((event) {
      print(event);
      if (event.data.isNotEmpty) _showNotification(event);
     });

    getToken();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Notification"),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Text("FCM Token"),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(fcmToken),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  requestingPermissionIos() async{
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print('User Granted Permission');
    }
    else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      print('User Granted Provisional Permission');
    }
    else{
      print('User Declined Or has not accepted permission');
    }

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

  }

  Future _showNotification(RemoteMessage message) async{
    const AndroidNotificationChannel channel = AndroidNotificationChannel('high_importance_channel', 'High Importance Notifications',importance: Importance.max);    

    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

    print(message.data);

    Map<String,dynamic> data = message.data;
    AndroidNotification? android = message.notification?.android;
    if(data!= null){
      flutterLocalNotificationsPlugin.show(
        0, 
        data['title'], 
        data['body'], 
        NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,icon: android?.smallIcon),
        ),
        payload: 'Default_Sound',
        );
    }
  }

  getToken() async {
    String? token = await _firebaseMessaging.getToken();
    setState(() {
      fcmToken = token!;
      print("FCM Token : "+fcmToken);
    });
  }

}