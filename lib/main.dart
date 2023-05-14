import 'package:chatapp/auth/view/name_register_screen.dart';
import 'package:chatapp/auth/view/number_register_screen.dart';
import 'package:chatapp/auth/view/start_screen.dart';
import 'package:chatapp/common/const/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          "/numberregisterscreen": (context) => const NumberRegisterScreen(),
          "/nameregisterscreen": (context) => const NameRegisterScreen(),
        },
      ),
    );
  }
}
