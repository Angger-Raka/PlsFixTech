import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            ElevatedButton(
              style: ButtonStyle(
                //make background orange
                backgroundColor: MaterialStateProperty.all(Colors.orange),
                //make rounded corners
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(100, 40)),
              ),
              onPressed: () {
                Get.back();
              },
              child: const Text('Go back'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('OR'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                //make background orange
                backgroundColor: MaterialStateProperty.all(Colors.orange),
                //make rounded corners
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                // make size bigger
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(100, 40)),
              ),
              onPressed: () {
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
              },
              child: const Text('Resend Email'),
            ),
          ],
        ));
  }
}
