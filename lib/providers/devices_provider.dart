import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DevicesProvider extends ChangeNotifier {
  bool _isCreatingDevice = false;
  bool get isCreatingDevice => _isCreatingDevice;
  set isCreatingDevice(bool value) {
    _isCreatingDevice = value;
    notifyListeners();
  }

  Future<void> createFanInDb(
      {required String idGoogle,
      required String name,
      required int state}) async {
    final uuid = const Uuid().v4();
    isCreatingDevice = true;
    DatabaseReference reference =
        FirebaseDatabase.instance.ref("ventiladores/$uuid");
    await reference.set({
      "idGoogle": idGoogle,
      "name": name,
      "state": state,
    });
    isCreatingDevice = false;
  }

  Future<void> createHeaterInDb(
      {required String idGoogle,
      required String name,
      required int state}) async {
    final uuid = const Uuid().v4();
    isCreatingDevice = true;
    DatabaseReference reference =
        FirebaseDatabase.instance.ref("calefones/$uuid");
    await reference.set({
      "idGoogle": idGoogle,
      "name": name,
      "state": state,
    });
    isCreatingDevice = false;
  }

  Future<void> createSensonTemperatureInDb(
      {required String idGoogle,
      required String name,
      required int state}) async {
    final uuid = const Uuid().v4();
    isCreatingDevice = true;
    DatabaseReference reference =
        FirebaseDatabase.instance.ref("sensoresTemps/$uuid");
    await reference.set({
      "idGoogle": idGoogle,
      "name": name,
      "state": state,
    });
    isCreatingDevice = false;
  }
}
