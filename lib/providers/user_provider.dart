import 'package:flutter/material.dart';
import 'package:instagram_flutter/models/user.dart';
import 'package:instagram_flutter/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  // _ denotes the variable is private field
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  // getter of _user object, ! indicates - user is not null
  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    // notify all the listeners to UserProvider, that the data of our global variable User has changed and the value should be updated.
    notifyListeners();
  }
}
