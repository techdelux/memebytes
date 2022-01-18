import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:memebytes/responsive/responsiveScreen.dart';
import 'package:memebytes/responsive/webLayout.dart';
import 'package:memebytes/responsive/mobileLayout.dart';
import 'package:memebytes/screens/loginScreen.dart';
import 'package:memebytes/screens/signupScreen.dart';
import 'package:memebytes/utils/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyClJN8TE6oZzCx1o2LqikYKfJbkxXRxoQQ",
        appId: "1:916401734708:web:09cd855f2eee035569f661",
        messagingSenderId: "916401734708",
        projectId: "memebytes-8a252",
        storageBucket: "memebytes-8a252.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const Memebytes());
}

class Memebytes extends StatelessWidget {
  const Memebytes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'memebytes',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const ResponsiveLayout(
                webScreenLayout: WebScreenLayout(),
                mobileScreenLayout: MobileScreenLayout(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
