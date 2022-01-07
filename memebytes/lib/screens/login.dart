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
      resizeToAvoidBottomInset: false,
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
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                  ),
                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                controller: emailController,
              ),
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                  ),
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
                          vertical: 15, horizontal: 40),
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
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Get.to(SignUp());
                },
                child: const Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
