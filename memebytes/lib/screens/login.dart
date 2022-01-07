// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memebytes/controllers/authController.dart';
import 'package:memebytes/screens/signup.dart';

class Login extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      // ignore: prefer_const_constructors
      body: Center(
        child: Container(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                controller: emailController,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                controller: passwordController,
                // obscureText: true,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      side: const BorderSide(color: Colors.amber),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                    ),

                    // onPressed: () async {
                    //   authController.register(emailController.text.trim(),
                    //       passwordController.text.trim());
                    // },

                    onPressed: () {
                      controller.login(
                          emailController.text, passwordController.text);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      side: const BorderSide(
                        color: Colors.amber,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                    ),
                    // onPressed: () async {
                    //   authController.login(emailController.text.trim(),
                    //       passwordController.text.trim());
                    // },
                    onPressed: () {
                      Get.to(SignUp());
                    },
                    child: const Text(
                      "SignUp",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
