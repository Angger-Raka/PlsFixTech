import 'package:flutter/material.dart';
import 'package:firebase_chatting/enums.dart';

import 'components/body.dart';

class InvoiceScreen extends StatelessWidget {
  static String routeName = "/invoice";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
