import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_app/core/errors/custom_exception.dart';
import 'package:fruits_app/core/models/firebase_error_messages.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthServer {
  // createUserWithEmailAndPassword-----------------------------------------------
  Future<User> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: FirebaseErrorMessages.weakPassword);
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: FirebaseErrorMessages.emailAlreadyInUse);
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: FirebaseErrorMessages.networkRequestFailed,
        );
      } else {
        throw CustomException(
          message: FirebaseErrorMessages.somethingWentWrong,
        );
      }
    } catch (e) {
      throw CustomException(message: FirebaseErrorMessages.somethingWentWrong);
    }
  }

  // signInWithEmailAndPassword-----------------------------------------------
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(message: FirebaseErrorMessages.userNotFound);
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: FirebaseErrorMessages.wrongPassword);
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: FirebaseErrorMessages.networkRequestFailed,
        );
      } else {
        throw CustomException(
          message: FirebaseErrorMessages.somethingWentWrong,
        );
      }
    } catch (e) {
      throw CustomException(message: FirebaseErrorMessages.somethingWentWrong);
    }
  }

  // signInWithGoogle-----------------------------------------------
  Future<User> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      throw CustomException(message: 'تم إلغاء تسجيل الدخول');
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in with Firebase
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  // signInWithFacebook-----------------------------------------------
  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  // signInWithApple-----------------------------------------------

  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider(
      "apple.com",
    ).credential(idToken: appleCredential.identityToken, rawNonce: rawNonce);

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return (await FirebaseAuth.instance.signInWithCredential(
      oauthCredential,
    )).user!;
  }
}
