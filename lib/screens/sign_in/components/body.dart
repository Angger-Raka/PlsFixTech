import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chatting/screens/login_success/login_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_chatting/models/components/no_account_text.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
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
                const Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                const SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SizedBox(height: getProportionateScreenHeight(20)),
                InkWell(
                  child: Text('Login as Anonymous'),
                  onTap: () {
                    if (FirebaseAuth.instance.currentUser == null) {
                      FirebaseAuth.instance.signInAnonymously();
                      Get.toNamed(LoginSuccessScreen.routeName);
                    } else {
                      Get.toNamed(LoginSuccessScreen.routeName);
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
