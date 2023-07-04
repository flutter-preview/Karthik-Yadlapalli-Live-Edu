import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_edu/screens/auth_screen.dart';
import 'package:live_edu/screens/splash_screen.dart';

import '../screens/home_screen.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot) {
          
          //*showing splash screen
          if(snapshot.connectionState == ConnectionState.waiting){
            return const SplashScreen();
          }
          
          //*user loged in
          if(snapshot.hasData){
            return const HomeScreen();
          }

          //*user not logged in
          else{
            return const AuthScreen();
          }
      },);
  }
}