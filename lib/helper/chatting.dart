import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

void main(){
  runApp(MyApp());
  addDataRealtime('angger', 'test1');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}

void addDataRealtime(String name, String Keterangan) {
  DateTime dateTimeNow = DateTime.now();

  Uri url = Uri.parse(
      'https://chatapp1-angger-default-rtdb.asia-southeast1.firebasedatabase.app/test.json');

  http.post(url,
      body: jsonEncode({
        'nama': name,
        'keterangan': Keterangan,
        'Waktu': dateTimeNow.toString()
      }));
}
