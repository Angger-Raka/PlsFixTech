import 'package:firebase_chatting/screens/chat/components/chat_input.dart';
import 'package:flutter/material.dart';

// This is the best practice
import '../components/chat_content.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [Expanded(child: DemoMessageList()), InputChat()],
    );
  }
}
