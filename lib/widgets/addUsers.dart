import 'package:flutter/material.dart';

import 'package:confort_zone/models/models.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  final String email;
  final String name;
  // final List<Map<String,dynamic>> ventiladores;

  AddUser(
    this.email, 
    this.name,
    // this.ventiladores
  );

  @override
  Widget build(BuildContext context) {

    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // final user = User.fromJson({})

    Future<void> addUser() async {
      // Call the user's CollectionReference to add a new user
      final response = await users
        .add  (  {
          'email': email, // John Doe
          'name': name, // Stokes and Sons
          'ventiladores': [] // List<Map>
        });

        print(response.id);
        // .then((value) => print("User Added"))
        // .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}

