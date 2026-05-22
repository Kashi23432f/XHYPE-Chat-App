import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/textfied.dart';
import 'package:flutter/material.dart';

class RegistarPage extends StatefulWidget {
  final void Function()? onTap;

  const RegistarPage({super.key, required this.onTap});

  @override
  State<RegistarPage> createState() => _RegistarPageState();
}

class _RegistarPageState extends State<RegistarPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController pwcontroller = TextEditingController();
  final TextEditingController repwcontroller = TextEditingController();

  void register(BuildContext context) async {
    final authservice = AuthService();
    if (pwcontroller.text == repwcontroller.text) {
      try {
        await authservice.signUpWithEmailPassword(
          emailcontroller.text,
          pwcontroller.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text("Password does not match")),
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
          Custfield(
            controller: repwcontroller,
            hinttext: "Re-Enter Password",
            obsecure: true,
          ),
          SizedBox(height: 20),
          MyButton(text: "Register Now", ontap: () => register(context)),

          SizedBox(height: 15),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login Now!",
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
