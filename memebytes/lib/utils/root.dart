// ignore_for_file: use_key_in_widget_constructors

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:memebytes/controllers/authController.dart';
import 'package:memebytes/screens/home.dart';
import 'package:memebytes/screens/login.dart';

class Root extends GetWidget<AuthController> {
  // const Root({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user != null) ? Home() : Login();
    });
  }
}
