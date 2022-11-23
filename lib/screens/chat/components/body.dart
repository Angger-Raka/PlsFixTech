import 'package:firebase_chatting/screens/chat/components/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:firebase_chatting/constants.dart';
import 'package:firebase_chatting/screens/sign_in/sign_in_screen.dart';
import 'package:firebase_chatting/size_config.dart';

// This is the best practice
import '../components/chat_content.dart';
import '../../../models/components/default_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Expanded(child: DemoMessageList()), InputChat()],
    );
  }
}
