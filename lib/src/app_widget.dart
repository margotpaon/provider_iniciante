import 'package:flutter/material.dart';
import 'package:provider_iniciante/src/features/auth/auth_page.dart';
import 'package:provider_iniciante/src/features/home/home_page.dart';
import 'package:provider_iniciante/src/features/splash_screen/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashPage(),
        '/auth': (_) => const AuthPage(),
        '/home': (_) => const HomePage(),
      },
    );
  }
}
