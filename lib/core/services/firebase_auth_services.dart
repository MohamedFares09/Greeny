import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_app/core/errors/exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception FirebaseAuthServices - createUserWithEmailAndPassword: ${e.code}");
      ServerException.handleFirebaseAuthException(e);
      throw CustomException('فشل في إنشاء الحساب. الرجاء المحاولة مرة أخرى.');
    } catch (e) {
      log("Exception FirebaseAuthServices - createUserWithEmailAndPassword: $e");
      throw CustomException('حدث خطأ ما. الرجاء المحاولة مرة أخرى.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception FirebaseAuthServices - signInWithEmailAndPassword: ${e.code}");
      ServerException.handleFirebaseAuthException(e);
      throw CustomException('فشل تسجيل الدخول. الرجاء المحاولة مرة أخرى.');
    } catch (e) {
      log("Exception FirebaseAuthServices - signInWithEmailAndPassword: $e");
      throw CustomException('حدث خطأ ما. الرجاء المحاولة مرة أخرى.');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      return (await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential))
          .user!;
    } catch (e) {
      log("Exception FirebaseAuthServices - signInWithEmailAndPassword: $e");
      throw CustomException('حدث خطأ ما. الرجاء المحاولة مرة أخرى.');
    }
  }
  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
