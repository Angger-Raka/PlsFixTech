import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_chatting/models/components/default_button.dart';
import 'package:firebase_chatting/screens/home/home_screen.dart';
import 'package:firebase_chatting/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Center(
          child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.userChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data?.email != null) {
                  return Text("SIGNED In: \n ${snapshot.data?.email}");
                } else if (snapshot.data?.uid != null) {
                  return Text('SIGNED In: \n ${snapshot.data?.uid}');
                } else {
                  return Text("You Haven't Signed in yet");
                }
              } else {
                return Text("You Haven't Signed in yet");
              }
            },
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.routeName, (route) => false);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
