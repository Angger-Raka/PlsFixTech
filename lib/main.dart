import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_chatting/routes.dart';
import 'package:firebase_chatting/screens/profile/profile_screen.dart';
import 'package:firebase_chatting/screens/splash/splash_screen.dart';
import 'package:firebase_chatting/theme.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      getPages: getPages,
    );
  }
}


// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_chatting/routes.dart';
// import 'package:firebase_chatting/screens/profile/profile_screen.dart';
// import 'package:firebase_chatting/screens/splash/splash_screen.dart';
// import 'package:firebase_chatting/theme.dart';
// import 'package:flutter/services.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.portraitUp,
//         DeviceOrientation.portraitDown,
//       ]);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: theme(),
//       // home: SplashScreen(),
//       // We use routeName so that we dont need to remember the name
//       initialRoute: SplashScreen.routeName,
//       routes: routes,
//     );
//   }
// }
