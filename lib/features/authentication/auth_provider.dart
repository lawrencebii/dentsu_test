import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:prime_template/features/authentication/views/login_page.dart';
import 'package:prime_template/features/navigation/views/navigation.dart';
import 'package:prime_template/utils/constants.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class AuthenticationProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool _keepMeLoggedIn = false;
  get keepMeLoggedIn => _keepMeLoggedIn;
  void toggleKeepMeLoggedIn(bool? val) {
    bool value = val ?? true;
    _keepMeLoggedIn = value;
    notifyListeners();
  }

  UserCredential? _userCredential;
  get userCredential => _userCredential;

//   login
  Future<void> logInUser(context) async {
    ProgressDialog pr = ProgressDialog(context);
    pr.show();
    UserCredential? user = await signInWithEmailAndPassword(context,
        usernameController.text.trim(), passwordController.text.trim());
    if (user == null) {
      user = await signUpWithEmailAndPassword(context,
          usernameController.text.trim(), passwordController.text.trim());
    }
    if (user != null) {
      _userCredential = user;
      notifyListeners();
      pr.hide();
      Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.leftToRight,
            duration: Duration(milliseconds: 300),
            child: Navigation()),
      );
    }
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showsnack(context, 'No user found for that email. Signing you up');
      } else if (e.code == 'wrong-password') {
        showsnack(context, 'Wrong password provided for that user.');
      }
      return null;
    }
  }

  Future<UserCredential?> signUpWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showsnack(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showsnack(context, 'The account already exists for that email.');
      }
      return null;
    } catch (e) {
      showsnack(context, e);
      return null;
    }
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }
}
