import 'package:firebase_chatting/screens/product_form/components/description.dart';
import 'package:firebase_chatting/screens/product_form/components/form.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Form(
      child: ListView(
        children: const [
          Description(),
          FormProduct(),
        ],
      ),
    ));
  }
}
