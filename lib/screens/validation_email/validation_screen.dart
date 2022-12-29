import 'package:flutter/material.dart';
import 'package:firebase_chatting/screens/validation_email/components/body.dart';

class ValidationScreen extends StatelessWidget {
  static String routeName = "/validation";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
