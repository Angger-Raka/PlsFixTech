import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_chatting/screens/chat/components/components_chat.dart';

class DemoMessageList extends StatefulWidget {
  const DemoMessageList({Key? key}) : super(key: key);
  @override
  _DemoMessageListState createState() => _DemoMessageListState();
}

class _DemoMessageListState extends State<DemoMessageList> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final getSender = auth.currentUser!.email.toString();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final Stream<QuerySnapshot> _usersStream = firestore
        .collection('User')
        .doc(getSender)
        .collection('Message')
        .orderBy('time', descending: true)
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ListView(
            reverse: true,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              if (data['name'] == getSender) {
                return MessageOwnTile(
                  message: data['description'],
                  messageDate: data['time'].toDate().toString(),
                );
              } else {
                return MessageTile(
                  message: data['description'],
                  messageDate: data['time'].toDate().toString(),
                );
              }
            }).toList(),
          ),
        );
      },
    );
  }
}
