// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:memebytes/controllers/authController.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:memebytes/controllers/userController.dart';
// import 'package:memebytes/utils/root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  // Get.lazyPut(() => UserController());
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Root(),
      ),
    );
  }
}
