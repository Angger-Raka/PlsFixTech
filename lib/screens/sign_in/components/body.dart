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
                  "Sign in with your email and password",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                const SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SizedBox(height: getProportionateScreenHeight(20)),
                InkWell(
                  child: const Text('Login as Guest'),
                  onTap: () {
                    // if (FirebaseAuth.instance.currentUser == null) {
                    //   FirebaseAuth.instance.signInAnonymously();
                    //   Get.toNamed(LoginSuccessScreen.routeName);
                    // } else {
                    //   Get.toNamed(LoginSuccessScreen.routeName);
                    // }
                    // add snackbar to show that feature is not available yet
                    Future.delayed(const Duration(seconds: 1), () {
                      Get.snackbar(
                        'This feature is not available yet :V',
                        'Avoid spam, Please wait for the next update',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.orange,
                        colorText: Colors.white,
                        duration: const Duration(seconds: 5),
                      );
                    });
                  },
                ),
                const NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
