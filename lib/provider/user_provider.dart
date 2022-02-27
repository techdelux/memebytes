import 'package:flutter/cupertino.dart';
import 'package:memebytes/connectivity/auth_method.dart';
import 'package:memebytes/models/user_model.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethod _authMethod = AuthMethod();
  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethod.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
