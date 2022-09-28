import 'package:flutter/material.dart';
import 'package:provider_iniciante/src/features/auth/auth_controller.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth')),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              onChanged: (value) {
                controller.authRequest =
                    controller.authRequest.copyWith(email: value);
              },
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              onChanged: (value) {
                controller.authRequest =
                    controller.authRequest.copyWith(password: value);
              },
            ),
            const SizedBox(height: 13),
            ElevatedButton(
              onPressed: () {
                controller.loginAction(context);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
