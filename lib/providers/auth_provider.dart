import 'package:confort_zone/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> signInWithGoogle() async {
    _isLoading = true;
    notifyListeners();

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final response =
          await FirebaseAuth.instance.signInWithCredential(credential);
      _user = UserModel(
        email: response.user!.email ?? "sin correo",
        idGoogle: response.user!.uid,
        name: response.user!.displayName ?? "sin nombre",
      );
    } catch (e) {
      print(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    _user = null;
    notifyListeners();
  }
}
