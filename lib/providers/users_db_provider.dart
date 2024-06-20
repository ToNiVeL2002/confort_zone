import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UsersDbProvider extends ChangeNotifier {
  bool _isCreatingUser = false;
  bool get isCreatingUser => _isCreatingUser;
  set isCreatingUser(bool value) {
    _isCreatingUser = value;
    notifyListeners();
  }

  Future<void> createUser(
      {required String name,
      required String email,
      required String idGoogle}) async {
    isCreatingUser = true;
    DatabaseReference reference =
        FirebaseDatabase.instance.ref("usuarios/$idGoogle");
    await reference.set({
      "name": name,
      "email": email,
      "idGoogle": idGoogle,
    });
    isCreatingUser = false;
  }
}
