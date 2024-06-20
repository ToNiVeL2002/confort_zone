import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersProvider extends ChangeNotifier {

  // ValueNotifier _userCredential = ValueNotifier('');

  // get userCredential => _userCredential;

  // set userCredentiall ( ValueNotifier value ) {
  //   _userCredential = value;
  // }

  String _uidUserAuth = '';

  get uidUserAuth => _uidUserAuth;

  set uidUserAuthh( String value ) {
    _uidUserAuth = value;

    notifyListeners();
  }

  final auth = FirebaseAuth.instance
    .authStateChanges()
    .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });




  


}