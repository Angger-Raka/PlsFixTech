import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/components/default_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.info_rounded,
              size: 100,
            ),
            const Text(
              'Check your email for a link verification, see on your inbox or spam folder and login again',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              child: DefaultButton(
                text: 'Resend Email',
                press: () async {
                  try {
                    FirebaseAuth.instance.currentUser!.sendEmailVerification();
                    Future.delayed(const Duration(seconds: 1), () {
                      Get.snackbar(
                        'Email sent',
                        'Check your email for a link verification, see on your inbox or spam folder and login again',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.orange,
                        colorText: Colors.white,
                        duration: const Duration(seconds: 5),
                      );
                    });
                    Get.back();
                  } catch (e) {
                    Get.snackbar('Error', e.toString());
                  }
                },
              ),
            )
          ],
        ));
  }
}
