// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class AuthService {
//   final FirebaseAuth _firebaseAuth;

//   AuthService(this._firebaseAuth);

//   Stream<User> get onAuthStateChanged => _firebaseAuth.authStateChanges();

//   Future<String> signInAnon() async {
//     try {
//       await _firebaseAuth.signInAnonymously();
//       return "Signed In";
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     } catch (e) {
//       return e.toString();
//     }
//   }
// }
