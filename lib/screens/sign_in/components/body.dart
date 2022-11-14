import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chatting/screens/login_success/login_success_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_chatting/models/components/no_account_text.dart';
import 'package:firebase_chatting/models/components/socal_card.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                InkWell(
                  child: Text('Login as Anonymous'),
                  onTap: () {
                    if (FirebaseAuth.instance.currentUser == null) {
                      FirebaseAuth.instance.signInAnonymously();
                      Navigator.pushNamed(
                          context, LoginSuccessScreen.routeName);
                      // Navigator.pushNamed(
                      //     context, LoginSuccessScreen.routeName);
                    } else {
                      // FirebaseAuth.instance.signInAnonymously();
                      Navigator.pushNamed(
                          context, LoginSuccessScreen.routeName);
                    }
                  },
                ),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
