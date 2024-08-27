import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/Screen/phone_verify.dart';
import '../Screen/homepage.dart';


class AuthPhone extends GetxController {
  RxBool loading = false.obs;
  final authphone = FirebaseAuth.instance;
  authPhone(String phone) async {
    loading.value = true;
    authphone.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {
        loading.value = false;
        Get.rawSnackbar(
            title: 'Verification failed',
            messageText: Text(
              error as String,
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black);
      },
      codeSent: (verificationId, forceResendingToken) {
        loading.value = false;
        Get.to(PhoneVerify(
          verifyid: verificationId,
        ));
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  authCredincial(String verify, String verifynum) async {
    loading.value = true;
    final credincial = PhoneAuthProvider.credential(
        verificationId: verify, smsCode: verifynum);
    try {
      loading.value = true;
      await authphone.signInWithCredential(credincial);
      Get.offAll(const Homepage());
      loading.value = false;
    } catch (e) {
      loading.value = false;
      return;
    }
  }
}
