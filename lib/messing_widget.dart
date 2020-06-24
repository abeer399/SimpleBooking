import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'Model/message.dart';


class MessagingWidget extends StatefulWidget {
  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> message =[];
  @override
  void initState(){
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async{
        print("OnMessage: $message");
      },
      onLaunch: (Map<String , dynamic> message) async{
        print("onLanch: $message");
      },
        onResume: (Map<String , dynamic> message) async{
      print("onResume: $message");
    }
    );
    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true,badge: true,alert: true)
    );
  }

  @override
  Widget build(BuildContext context) => ListView(
    children: message.map(buildMessage).toList(),
  );
  Widget buildMessage(Message message)=>ListTile(
    title: Text(message.title),
    subtitle: Text(message.body),
  );
}
