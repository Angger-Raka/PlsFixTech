import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_chatting/screens/chat/components/components_chat.dart';

class DemoMessageList extends StatelessWidget {
  const DemoMessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView(
        children: const [
          DateLabel(label: "Yesterday"),
          MessageTile(
              message: 'Ada yang bisa saya bantu ?',
              messageDate: '12:31 PM'),
          MessageOwnTile(
              message: 'Bisa saya minta invoice nya ?', messageDate: '12:35 PM'),
          MessageTile(
              message: 'Baik harap tunggu sebentar', messageDate: '12:39 PM'),
          transaction_deal(),
          MessageOwnTile(message: 'Sip Mantap', messageDate: '12:40 PM'),
        ],
      ),
    );
  }
}
