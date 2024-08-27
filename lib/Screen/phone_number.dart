import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/controller/auth_phone.dart';
import 'package:todo_app/custom/custom_button.dart';
import 'package:todo_app/custom/custom_text.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final phone = TextEditingController();
    final key = GlobalKey<FormState>();
    final authphonec = Get.put(AuthPhone());
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.blue,
        title: const CustomText(
            text: 'Login with phone',
            size: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
      ),
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/anim/otp.json',height: 250,width: 250),
                   const  SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: phone,
                      cursorColor: Colors.blueAccent,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Number !';
                        } else if (value.length < 14 ) {
                          return 'Enter valid number ';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.blueAccent,
                              width: 1.5,
                            )),
                        filled: false,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(20),
                        prefixIcon: const Icon(
                          Icons.call,
                          color: Colors.blue,
                        ),
                        labelText: 'Enter Phone Number',
                        labelStyle: const TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 1.5,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 1.5,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.5,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() => authphonec.loading.value == true
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            text: 'Send OTP',
                            ontap: () {
                              if (key.currentState!.validate()) {
                                authphonec.authPhone(phone.text);
                              }
                              return;
                            },
                          ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
