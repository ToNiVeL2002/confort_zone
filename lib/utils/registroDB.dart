import 'package:cloud_firestore/cloud_firestore.dart';

class Registro {

  final String idUsuario;
  final String email;
  final String name;

  Registro({
    required this.idUsuario,
    required this.email, 
    required this.name
  });

  CollectionReference users = FirebaseFirestore.instance.collection('usuarios');

  Future<void> addUser() async {
    // Call the user's CollectionReference to add a new user
    final response = await users
      .add  (  {
        'id': idUsuario,
        'email': email, // John Doe
        'name': name, // Stokes and Sons
        'ventiladores': [] // List<Map>
      });

      print(response.id);
      // .then((value) => print("User Added"))
      // .catchError((error) => print("Failed to add user: $error"));
  }
}