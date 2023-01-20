import 'package:firebase_chatting/screens/invoice/components/content.dart';
import 'package:firebase_chatting/screens/invoice/components/preview.dart';
import 'package:flutter/cupertino.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [PreviewProduct(), ContentInvoice()],
      ),
    );
  }
}
