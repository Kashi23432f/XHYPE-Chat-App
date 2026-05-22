import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/textfied.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController pwcontroller = TextEditingController();

  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
        emailcontroller.text,
        pwcontroller.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 20),

          Icon(
            Icons.message,
            color: Theme.of(context).colorScheme.inversePrimary,
            size: 250,
          ),
          Center(
            child: Text(
              "HYPEX",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 35,
                fontWeight: FontWeight(700),
              ),
            ),
          ),

          SizedBox(height: 15),
          Custfield(
            controller: emailcontroller,
            hinttext: "Email",
            obsecure: false,
          ),

          SizedBox(height: 20),
          Custfield(
            controller: pwcontroller,
            hinttext: "Password",
            obsecure: true,
          ),
          SizedBox(height: 20),
          MyButton(text: "Log in", ontap: () => login(context)),

          SizedBox(height: 15),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New Account.",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register Here!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
