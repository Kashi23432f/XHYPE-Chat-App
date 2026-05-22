import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/splash/splash.dart';
import 'package:chat_app/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // 1. Ensure Flutter framework is ready
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Safely initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 3. MANDATORY: Wrap MyApp inside the Provider inside runApp()
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 4. FIX: Use a Consumer widget here so the context has access to ThemeProvider
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: themeProvider.themeData, // Access theme cleanly
          home: const SplashScreen(),
        );
      },
    );
  }
}
