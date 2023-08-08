import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final String _isLoggedInKey = 'isLoggedIn';
  static final String _emailKey = 'email';
  static final String _passwordKey = 'password';

  static Future<void> saveUserDetails(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_isLoggedInKey, true); // User is logged in
    prefs.setString(_emailKey, email);
    prefs.setString(_passwordKey, password);
  }

  static Future<bool> getUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_emailKey);
  }

  static Future<String?> getUserPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_passwordKey);
  }

  static Future<void> clearUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_isLoggedInKey, false); // User is logged out
    prefs.remove(_emailKey);
    prefs.remove(_passwordKey);
  }
}
