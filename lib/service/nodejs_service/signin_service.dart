import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class SignInAccount extends StateNotifier<String> {
  SignInAccount() : super('');

  Future<void> signInAccount(String email, String password) async {
    try {
      final response = await http.post(
          Uri.parse('https://console.firebase.google.com/u/0/project/sidd-8e8b7/database/sidd-8e8b7-default-rtdb/data/~2F'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            "email":email,
            "password": password,
          }));
    
     
      if (response.statusCode == 200) {
        state = response.body.toString();
      } else {
        state = 'error';
      }
    } catch (e) {
      rethrow;
    }
  }
}

final signInAccountProvider =
    StateNotifierProvider<SignInAccount, String>((ref) => SignInAccount());
