import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chatting/helper/chatting_firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_chatting/screens/chat/components/components_chat.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DemoMessageList extends StatefulWidget {
  const DemoMessageList({Key? key}) : super(key: key);

  @override
  State<DemoMessageList> createState() => _DemoMessageListState();
}

class _DemoMessageListState extends State<DemoMessageList> {
  @override
  Widget build(BuildContext context) {
    @override
    initState() {
      readRealtimeFirebase();
      super.initState();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: (widgetMessageClient == null)
          ? const Center(
              child: Text('First time? lets chat'),
            )
          : ListView.builder(
              itemCount: widgetMessageClient.length,
              itemBuilder: (context, index) {
                return widgetMessageClient[index];
              },
            ),
    );
  }
}




// class DemoMessageList extends StatelessWidget {
//   const DemoMessageList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: ListView(
//         children: const [
//           DateLabel(label: "Yesterday"),
//           MessageTile(
//               message: 'Ada yang bisa saya bantu ?',
//               messageDate: '12:31 PM'),
//           MessageOwnTile(
//               message: 'Bisa saya minta invoice nya ?', messageDate: '12:35 PM'),
//           MessageTile(
//               message: 'Baik harap tunggu sebentar', messageDate: '12:39 PM'),
//           transaction_deal(),
//           MessageOwnTile(message: 'Sip Mantap', messageDate: '12:40 PM'),
//         ],
//       ),
//     );
//   }
// }

// class DemoMessageList extends StatefulWidget {
//   const DemoMessageList({Key? key}) : super(key: key);
//   @override
//   State<DemoMessageList> createState() => _DemoMessageListState();
// }

// class _DemoMessageListState extends State<DemoMessageList> {
//   void intiState() {
//     readRealtimeFirebase();
//     super.initState();
//   }

//   // List messageClient = [];
//   // List widgetMessageClient = [];

//   // Future<void> readRealtimeFirebase() async {
//   //   final FirebaseAuth auth = FirebaseAuth.instance;
//   //   Uri url = Uri.parse(
//   //       'https://chatapp1-angger-default-rtdb.asia-southeast1.firebasedatabase.app/client1.json');

//   //   http.get(url).then((value) {
//   //     var dataresponse = jsonDecode(value.body) as Map<String, dynamic>;
//   //     dataresponse.forEach((key, value) {
//   //       var dateTimeParse = DateTime.parse(value['time']);
//   //       print(value['name']);
//   //       print(value['description']);
//   //       print(value['time']);
//   //       if (value['name'] == auth.currentUser!.email.toString()) {
//   //         messageClient.add({
//   //           'name': value['name'],
//   //           'description': value['description'],
//   //           'time': dateTimeParse,
//   //           'key': key,
//   //           'type': 'send'
//   //         });
//   //         widgetMessageClient.add(MessageOwnTile(
//   //           message: value['description'],
//   //           messageDate: dateTimeParse.toString(),
//   //         ));
//   //       } else {
//   //         messageClient.add({
//   //           'name': value['name'],
//   //           'description': value['description'],
//   //           'time': dateTimeParse,
//   //           'key': key,
//   //           'type': 'receive'
//   //         });
//   //         widgetMessageClient.add(MessageTile(
//   //           message: value['description'],
//   //           messageDate: dateTimeParse.toString(),
//   //         ));
//   //       }
//   //     });
//   //     print(dataresponse);
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // setState(() {
//     //   readRealtimeFirebase();
//     // });
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: ListView.builder(
//         itemCount: widgetMessageClient.length,
//         itemBuilder: (context, index) {
//           return widgetMessageClient[index];
//         },
//       ),
//     );
//   }
// }
