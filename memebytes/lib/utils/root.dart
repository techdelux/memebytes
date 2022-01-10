// ignore_for_file: use_key_in_widget_constructors

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:memebytes/controllers/authController.dart';
import 'package:memebytes/controllers/userController.dart';
import 'package:memebytes/screens/home.dart';
import 'package:memebytes/screens/login.dart';

// class Root extends GetWidget<AuthController> {
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       // Get.put<UserController>(UserController());
//       return (Get.find<AuthController>().user != null) ? Home() : Login();
//     });
//   }
// }

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        return (Get.find<AuthController>().user?.uid != null)
            ? Home()
            : Login();
      },
    );
  }
}
