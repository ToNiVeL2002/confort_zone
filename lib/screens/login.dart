import 'package:flutter/material.dart';

import 'package:confort_zone/provider/providers.dart';
import 'package:confort_zone/services/auth_google.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final userProvider = Provider.of<UsersProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        
          children: [
            const Text(
              'LOGGIN CONFORT ZONE',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
        
            FloatingActionButton(
              child: const Center(
                child: Text('G'),
              ),
              onPressed: () async {
        
                try {
                  final authUser = AuthUser();
                  final user = authUser.loginGoogle();
        
                  if (user != null) {
                    userProvider.uidUserAuthh = FirebaseAuth.instance.currentUser!.uid;
                    Navigator.pushNamed(context, 'home');
                  }
                } on FirebaseAuthException catch(error) {
                  print(error.message);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error.message ?? 'Ups... Algo salio mal'),
                    )
                  );
                }catch (error) {
                  print(error);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error.toString()),
                    )
                  );
                }
        
                // usersProvider.entradaa1 = _controller1.text;
                // usersProvider.userCredential.value = await signInWithGoogle();
        
                // print('++++++++++++ ${usersProvider.userCredential}');
        
                // if (usersProvider.userCredential.value != null) {
                //   print(usersProvider.userCredential.value.user!.email);
        
                //   Navigator.pushNamed(context, 'home');
                // } else {
                //   print('moral choqito');
                // }
        
                // AddUser('miEmail@gmail.com', 'mio');

              }
            )
          ],
          
        ),
      )
    );
  }
}