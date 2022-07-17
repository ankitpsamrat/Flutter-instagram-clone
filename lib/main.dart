import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/screens/signup_screen.dart';
import 'package:instagram/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          // apiKey: "AIzaSyCmHXkzcRN_pXSJr0eVAoNl4AD2gk9qgLM",
          // appId: "1:912195814616:web:15da0aa6dcf39a03d343ad",
          // messagingSenderId: "912195814616",
          // projectId: "instagram-914a4",
          // storageBucket: "instagram-914a4.appspot.com",
          apiKey: "AIzaSyCmHXkzcRN_pXSJr0eVAoNl4AD2gk9qgLM",
          authDomain: "instagram-914a4.firebaseapp.com",
          projectId: "instagram-914a4",
          storageBucket: "instagram-914a4.appspot.com",
          messagingSenderId: "912195814616",
          appId: "1:912195814616:web:15da0aa6dcf39a03d343ad",
          measurementId: "G-NLY3HDP1B6"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: LoginScreen(),
      // home: SignupScreen(),
    );
  }
}
