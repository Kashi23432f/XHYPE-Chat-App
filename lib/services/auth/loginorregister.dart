import 'package:chat_app/screens/login.dart';
import 'package:chat_app/screens/register.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showlogin = true;

  void togglePages() {
    setState(() {
      showlogin = !showlogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showlogin) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegistarPage(onTap: togglePages);
    }
  }
}
