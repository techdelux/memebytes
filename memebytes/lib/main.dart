import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:memebytes/responsive/mobileLayout.dart';
import 'package:memebytes/responsive/responsiveScreen.dart';
import 'package:memebytes/responsive/webLayout.dart';
import 'package:memebytes/utils/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: const ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}
