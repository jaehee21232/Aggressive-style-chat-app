import 'package:chatapp/auth/view/register_screen.dart';
import 'package:chatapp/auth/view/start_screen.dart';
import 'package:chatapp/common/const/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'chatapp',
        theme: whiteTheme,
        home: StartScreen(),
        routes: {
          "/registerscreen": (context) => const RegisterScreen(),
        },
      ),
    );
  }
}
