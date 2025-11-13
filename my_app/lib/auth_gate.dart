import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'login_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // User is signed in, navigate to the home page
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('/home');
          });
          // Return a placeholder while redirecting
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          // User is not signed in, show the login page
          return const LoginPage();
        }
      },
    );
  }
}
