import 'package:confort_zone/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:confort_zone/services/auth_google.dart';
import 'package:confort_zone/utils/registroDB.dart';
import 'package:confort_zone/widgets/addUsers.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Key salir1 = Key('salir1');
    final Key salir2 = Key('salir2');

    var user = FirebaseAuth.instance.currentUser;
    final userProvider = Provider.of<UsersProvider>(context);
    final registroProvider = Provider.of<RegistroProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              user?.displayName ?? 'Usuario',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),

            Text(
              user?.uid ?? 'Usuarioo',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),

            FloatingActionButton(
              heroTag: null,
              key: salir1,
              onPressed: () async {
                final authUser = AuthUser();
                bool user = await authUser.signOutFromGoogle();

                if (user) {
                  userProvider.uidUserAuthh = '';
                  Navigator.pop(context);
                }
              },
              child: const Text('Salir'),
            ),

            Text(
              userProvider.uidUserAuth,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),

            // AddUser('hola@gmail.com', 'samuel'),

            FloatingActionButton(
              heroTag: null,
              key: salir2,
              onPressed: () async {

                registroProvider.idUsuarioo = user!.uid;
                registroProvider.emaill = user.email ?? '';
                registroProvider.namee = user.displayName ?? 'Usuario';

                registroProvider.addUser();

                
              },
              child: const Text('Salir'),
            ),
          ],
        ),
      )
    );
  }
}