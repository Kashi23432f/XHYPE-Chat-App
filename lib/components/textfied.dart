import 'package:flutter/material.dart';

class Custfield extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final bool obsecure;

  const Custfield({
    super.key,
    required this.controller,
    required this.hinttext,
    required this.obsecure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          hintText: hinttext,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        controller: controller,
        obscureText: obsecure,
      ),
    );
  }
}
