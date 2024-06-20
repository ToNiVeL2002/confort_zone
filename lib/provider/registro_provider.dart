import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class RegistroProvider extends ChangeNotifier {


  String _idUsuario = '';
  String _email = '';
  String _name = '';

  get idUsuario => _idUsuario;

  get email => _email;

  get name => _name;

  set idUsuarioo ( String value ) {
    _idUsuario = value;

    notifyListeners();
  } 

  set emaill ( String value ) {
    _email = value;

    notifyListeners();
  } 

  set namee ( String value ) {
    _name = value;

    notifyListeners();
  } 

  CollectionReference users = FirebaseFirestore.instance.collection('usuarios');

  Future<void> addUser() async {
    // Call the user's CollectionReference to add a new user
    final response = await users
      .add  (  {
        'id': _idUsuario,
        'email': _email, // John Doe
        'name': _name, // Stokes and Sons
        'ventiladores': [] // List<Map>
      });

      print(response.id);
      // .then((value) => print("User Added"))
      // .catchError((error) => print("Failed to add user: $error"));
  }

}