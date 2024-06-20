import 'package:confort_zone/providers/auth_provider.dart';
import 'package:confort_zone/providers/users_db_provider.dart';
import 'package:confort_zone/screens/devices_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final usersDbProvider = context.watch<UsersDbProvider>();
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "CONFORT ZONE",
            style: TextStyle(color: Colors.black, fontSize: 40),
          ),
          ElevatedButton(
            onPressed: () async {
              await authProvider.signInWithGoogle();
              await usersDbProvider.createUser(
                  name: authProvider.user!.name,
                  email: authProvider.user!.email,
                  idGoogle: authProvider.user!.idGoogle);
              if (!authProvider.isLoading && !usersDbProvider.isCreatingUser) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DevicesScreen()));
              }
            },
            child: authProvider.isLoading || usersDbProvider.isCreatingUser
                ? const CircularProgressIndicator()
                : const Text('Sign in with Google'),
          )
        ],
      )),
    );
  }
}
