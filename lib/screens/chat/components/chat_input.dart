import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chatting/helper/chatting_firebase.dart';
import 'package:firebase_chatting/models/components/glowing_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import './chat_content.dart';

class InputChat extends StatefulWidget {
  InputChat({Key? key}) : super(key: key);

  @override
  State<InputChat> createState() => _InputChatState();
}

class _InputChatState extends State<InputChat> {
  final messageController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 2, color: Colors.transparent))),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(CupertinoIcons.paperclip),
            ),
          ),
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: 'Klik untuk message',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 24,
            ),
            child: GlowingActionButton(
              size: 40,
              color: Colors.orange,
              icon: Icons.send_rounded,
              onPressed: () async {
                try {
                  sendMessageData(messageController.text);
                } catch (e) {
                  print(e);
                } finally {
                  messageController.clear();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
