
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:todo_app/controller/auth_phone.dart';
import '../custom/custom_button.dart';
import '../custom/custom_text.dart';

class PhoneVerify extends StatelessWidget {
  final String verifyid;
  const PhoneVerify({super.key, required this.verifyid});

  @override
  Widget build(BuildContext context) {
    final verifynum = TextEditingController();
    final key = GlobalKey<FormState>();
    final auth = Get.put(AuthPhone());

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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/anim/verify.json',height: 250,width: 250),
               const  SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: verifynum,
                  cursorColor: Colors.blueAccent,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Number !';
                    } else if (value.length < 6 || value.length > 6) {
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
                      Icons.password,
                      color: Colors.blue,
                    ),
                    hintText: 'Enter 6 digits code',
                    hintStyle: const TextStyle(
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
                CustomButton(
                  text: 'Verify',
                  ontap: () async {
                    if (key.currentState!.validate()) {
                      auth.authCredincial(verifyid, verifynum.text.toString());
                    }
                    return;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
