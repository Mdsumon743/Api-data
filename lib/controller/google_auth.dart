import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app/Screen/homepage.dart';

class GoogleAuth extends GetxController {
  RxBool isLoad = false.obs;

  googleSignin() async {
    isLoad.value = true;
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuthentication =
        await googleSignInAccount?.authentication;
    final credencial = GoogleAuthProvider.credential(
        accessToken: googleAuthentication?.accessToken,
        idToken: googleAuthentication?.idToken);
    isLoad.value = false;
    return await FirebaseAuth.instance.signInWithCredential(credencial).then(
      (value) {
        Get.offAll(const Homepage());
      },
    );
  }
}
