// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memebytes/controllers/authController.dart';
// import 'package:memebytes/screens/login.dart';

class Home extends GetWidget<AuthController> {
  // const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('HOMESCREEN'),
            OutlinedButton(
                onPressed: () {
                  controller.signOut();
                  // Get.to(Login());
                },
                child: Text('Sign Out'))
          ],
        ),
      ),
    );
  }
}
