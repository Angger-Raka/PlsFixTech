import 'package:firebase_chatting/enums.dart';
import 'package:flutter/material.dart';
import 'package:firebase_chatting/screens/chat/components/body.dart';
import 'package:firebase_chatting/size_config.dart';

import '../../models/components/coustom_bottom_nav_bar.dart';

class ChatScreen extends StatefulWidget {
  static String routeName = "/chat";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Chat",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.message),
    );
  }
}
