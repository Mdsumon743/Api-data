import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/Screen/homepage.dart';
import 'package:todo_app/Screen/login.dart';
import 'package:todo_app/custom/custom_text.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        if(FirebaseAuth.instance.currentUser != null){
          Get.offAll(const Homepage());
        } else{
          Get.offAll(const Login());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                    text: 'TO',
                    size: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
                CustomText(
                    text: 'DO',
                    size: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue)
              ],
            ),
            Lottie.asset('assets/anim/time2.json', height: 80, width: 80),
          ],
        ),
      ),
    );
  }
}
