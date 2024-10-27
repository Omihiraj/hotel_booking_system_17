import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel_booking_app/services/firebase_services.dart';

class FirebaseAuthService {
  static Future<String> signIn(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-credential") {
        return "invalid-credential";
      } else {
        return "error";
      }
    }
  }

  static signUp(
      {required String email,
      required String password,
      required String name,
      required String mobileNo,
      required String address}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        FirebaseServices.addSignUpData(
            email: email, name: name, address: address, mobileNo: mobileNo);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
