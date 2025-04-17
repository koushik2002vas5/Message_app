import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';
import 'chat_screen.dart';
import 'register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Message Board App',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xFFFAFAFA), // Soft white
        primaryColor: Color(0xFF00BCD4), // Sky blue
        colorScheme: ColorScheme.light(
          primary: Color(0xFF00BCD4), // Sky blue
          secondary: Color(0xFFF48FB1), // Light pink
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 3,
          titleTextStyle: TextStyle(
            color: Color(0xFF00BCD4),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Color(0xFFF48FB1)),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
          bodyMedium: TextStyle(color: Colors.black54),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00BCD4),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF00BCD4), // Sky blue
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(color: Colors.grey[500]),
          labelStyle: TextStyle(color: Color(0xFF00BCD4)), // Sky blue
        ),
        cardColor: Colors.white,
      ),
      initialRoute: isLoggedIn ? '/home' : '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/register': (context) => RegisterScreen(),
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => SettingsScreen(),
        '/chat': (context) => ChatScreen(
              boardName: ModalRoute.of(context)!.settings.arguments as String,
            ),
      },
    );
  }
}
