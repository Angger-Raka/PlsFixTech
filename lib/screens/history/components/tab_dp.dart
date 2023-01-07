import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chatting/screens/history/components/card_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabNeedToPlay extends StatefulWidget {
  const TabNeedToPlay({Key? key}) : super(key: key);

  @override
  State<TabNeedToPlay> createState() => _TabNeedToPlayState();
}

class _TabNeedToPlayState extends State<TabNeedToPlay> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final getSender = auth.currentUser!.email.toString();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final Stream<QuerySnapshot> _orderStream = firestore
        .collection('User')
        .doc(getSender)
        .collection('Product')
        .orderBy('time', descending: true)
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: _orderStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            if (data['status'] == 'Need to pay') {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: product_history(
                  name: data['product'],
                  status: data['status'],
                  description: data['description'],
                  price: data['price'],
                  image: data['image'].toString(),
                ),
              );
            } else {
              return Container();
            }
          }).toList(),
        );
      },
    );
  }
}
