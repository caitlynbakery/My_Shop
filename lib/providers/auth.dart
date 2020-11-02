import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> authenticate(String email, String password, String urlSegment) async {

  }

  Future<void> signup(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyB28k_LfSGGtnK0i74MvASAMaQ8xxW7fxI';

    final response = await http.post(url,
        body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true}));
            print(json.decode(response.body));
  }

  Future<void> signIn(String email, String password) async {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyB28k_LfSGGtnK0i74MvASAMaQ8xxW7fxI';

      final response = await http.post(url,
        body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true}));
            print(json.decode(response.body));
  }
  
}
