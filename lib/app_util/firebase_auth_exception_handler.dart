import 'package:firebase_auth/firebase_auth.dart';

class FirebaseExceptionHandler {
  static String handleException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'The user corresponding to the given email has been disabled.';
      case 'user-not-found':
        return 'No user found for the given email.';
      case 'wrong-password':
        return 'The password is incorrect.';
      default:
        return 'An undefined error happened.';
    }
  }
}
