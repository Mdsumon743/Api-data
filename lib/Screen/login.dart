import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/Screen/phone_number.dart';
import 'package:todo_app/controller/google_auth.dart';
import 'package:todo_app/custom/custom_login_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final googleAuth = Get.put(GoogleAuth());
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/login.png',
                height: 120,
                width: 120,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomLoginButton(
                image: 'assets/images/phone.png',
                name: 'Login with Phone ',
                ontap: () {
                  Get.to(const PhoneNumber());
                },
              ),
              Obx(
                () => googleAuth.isLoad.value == true
                    ? const CircularProgressIndicator(
                        color: Colors.blue,
                      )
                    : CustomLoginButton(
                        image: 'assets/images/search.png',
                        name: 'Login with Google ',
                        ontap: () {
                          googleAuth.googleSignin();
                        },
                      ),
              ),
              CustomLoginButton(
                image: 'assets/images/mail.png',
                name: 'Login with Email ',
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
