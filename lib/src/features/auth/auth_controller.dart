import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider_iniciante/src/features/auth/auth_request_model.dart';
import 'package:provider_iniciante/src/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
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
}
