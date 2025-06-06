
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../pages/Auth/login_page.dart';
import '../../pages/dashboard.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ( context, snapshot) {
          if(snapshot.hasData){
            return const Dashboard();
          }else
            {
              return const LoginPage();
            }
        },

      ),
    );
  }
}
