import 'dart:async';
import 'package:chat_app/services/auth/auth_gate.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    // 3. Define the drop path and use the Bounce curve
    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 2), // Start high off-screen
          end: Offset.zero, // Stop perfectly in the center
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.bounceOut, // This creates the bouncing physics
          ),
        );

    // 4. Start the bouncing animation immediately
    _animationController.forward();

    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthGate()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Center(
          child: SlideTransition(
            position: _slideAnimation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.message,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 100,
                ),
                SizedBox(width: 10),
                Text(
                  "HYPEX",
                  style: TextStyle(
                    fontSize: 65,
                    fontWeight: FontWeight(700),
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
