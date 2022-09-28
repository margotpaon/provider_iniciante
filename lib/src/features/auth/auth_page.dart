import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider_iniciante/src/features/auth/auth_request_model.dart';
import 'package:provider_iniciante/src/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  var authRequest = AuthRequestModel('', '');

  Future<void> loginAction(BuildContext context) async {
    try {
      final response = await Dio()
          .post('http://localhost:8080/auth', data: authRequest.toMap());
      final shared = await SharedPreferences.getInstance();
      globaUserModel = UserModel.fromMap(jsonDecode(response.data));
      await shared.setString('UserModel', globaUserModel!.toJson());
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Erro na autenticação')));
    }
  }

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
                authRequest = authRequest.copyWith(email: value);
              },
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              onChanged: (value) {
                authRequest = authRequest.copyWith(password: value);
              },
            ),
            const SizedBox(height: 13),
            ElevatedButton(
              onPressed: () {
                loginAction(context);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
