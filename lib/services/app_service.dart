import 'package:flutter/material.dart';
class AppService with ChangeNotifier {
  // AppService(this.sharedPreferences) {
  //   onAppStart();
  // }

  // late final SharedPreferences sharedPreferences;
  bool _loginState = false;
  bool _initialized = false;

  bool get loginState => _loginState;
  bool get initialized => _initialized;

  String _authViewname = '';
  String get authViewname => _authViewname;

  set authViewName(String value) {
    _authViewname = value;
    notifyListeners();
  }


}
