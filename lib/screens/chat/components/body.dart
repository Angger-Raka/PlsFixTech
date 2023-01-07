import 'package:firebase_chatting/screens/chat/components/chat_input.dart';
import 'package:flutter/material.dart';

// This is the best practice
import '../components/chat_content.dart';
import 'notification.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Stack(
            children: const [
              DemoMessageList(),
              NotificationListSlider(),
            ],
          ),
        ),
        const InputChat()
      ],
    );
  }
}
