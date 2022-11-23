import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chatting/screens/chat/components/components_chat.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

void addMessageClient(String sender, String description) {
  DateTime dateTimeNow = DateTime.now();

  Uri url = Uri.parse(
      'https://chatapp1-angger-default-rtdb.asia-southeast1.firebasedatabase.app/client1.json');

  http.post(url,
      body: jsonEncode({
        'name': sender,
        'description': description,
        'time': dateTimeNow.toString()
      }));
}

Future<void> getMessageClient() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Uri url = Uri.parse(
      'https://chatapp1-angger-default-rtdb.asia-southeast1.firebasedatabase.app/client1.json');

  http.get(url).then((value) {
    var dataresponse = jsonDecode(value.body) as Map<String, dynamic>;
    dataresponse.forEach((key, value) {
      var dateTimeParse = DateTime.parse(value['time']);
      print(value['name']);
      print(value['description']);
      print(value['time']);
      if (value['name'] == auth.currentUser!.email.toString()) {
      } else {}
    });
    print(dataresponse);
  });
}

List messageClient = [];
List widgetMessageClient = [];

Future<void> readRealtimeFirebase() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Uri url = Uri.parse(
      'https://chatapp1-angger-default-rtdb.asia-southeast1.firebasedatabase.app/client1.json');

  return http.get(url).then((value) {
    var dataresponse = jsonDecode(value.body) as Map<String, dynamic>;
    dataresponse.forEach((key, value) {
      var dateTimeParse = DateTime.parse(value['time']);
      print(value['name']);
      print(value['description']);
      print(value['time']);
      if (value['name'] == auth.currentUser!.email.toString()) {
        messageClient.add({
          'name': value['name'],
          'description': value['description'],
          'time': dateTimeParse,
          'key': key,
          'type': 'send'
        });
        widgetMessageClient.add(MessageOwnTile(
          message: value['description'],
          messageDate: dateTimeParse.toString(),
        ));
      } else {
        messageClient.add({
          'name': value['name'],
          'description': value['description'],
          'time': dateTimeParse,
          'key': key,
          'type': 'receive'
        });
        widgetMessageClient.add(MessageTile(
          message: value['description'],
          messageDate: dateTimeParse.toString(),
        ));
      }
    });
    print(widgetMessageClient);
  });
}
