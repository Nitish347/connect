import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/models/user.dart';
import 'package:untitled6/resources/auth_method.dart';

class UserProvider with ChangeNotifier {
  UserData? _user;
  final AuthMethods _authMethods = AuthMethods();
  UserData get getUser => _user!;
  Future<void> refreshUser() async {
    UserData user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
