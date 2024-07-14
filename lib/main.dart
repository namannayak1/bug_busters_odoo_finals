import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finals_oddo/screens/admin_bottom_bar.dart';
import 'package:finals_oddo/screens/user_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finals_oddo/screens/auth.dart';
import 'package:finals_oddo/screens/user_bottom_bar.dart';

// Define your screens here

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // User is not logged in
        if (!snapshot.hasData) {
          return const AuthScreen();
        }

        // User is logged in
        User? user = snapshot.data;
        if (user != null) {
          return FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance.collection('users').doc(user.uid).get(),
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (!userSnapshot.hasData || !userSnapshot.data!.exists) {
                // No user document exists, navigate to PreferencesScreen
                return const UserPreferences();
              }

              final userData = userSnapshot.data!.data() as Map<String, dynamic>;

              if (userData['isAdmin'] == true) {
                // User is an admin, navigate to AdminBottomBar
                return const AdminBottomBar();
              } else {
                // Regular user, navigate to UserBottomBar
                return const UserBottomBar();
              }
            },
          );
        }

        // Just in case, fallback
        return const AuthScreen();
      },
    );
  }
}

