import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';
import 'screens/welcome_scren.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'info_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
        body1: TextStyle(color: Colors.black54),
        body2: TextStyle(color: Colors.black54),
      )),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        InfoScreen.id: (context) => InfoScreen(),
      },
    );
  }
}
