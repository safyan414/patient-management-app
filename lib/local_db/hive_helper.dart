import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveHelper {
  static const String _boxName = 'login_box';

  // Initialize Hive
  static Future<void> init() async {
    await Hive.initFlutter();
    await _openBox();
  }

  // Open Hive box
  static Future<void> _openBox() async {
    await Hive.openBox(_boxName);
  }

  // Save login status
  static Future<void> saveLoginStatus({required bool isLoggedIn, required bool isAdmin}) async {
    final box = Hive.box(_boxName);
    await box.put('isLoggedIn', isLoggedIn);
    await box.put('isAdmin', isAdmin);
  }

  // Retrieve login status
  static Future<Map<String, dynamic>> getLoginStatus() async {
    final box = await Hive.openBox(_boxName);
    bool isLoggedIn = box.get('isLoggedIn', defaultValue: false);
    bool isAdmin = box.get('isAdmin', defaultValue: false);
    return {'isLoggedIn': isLoggedIn, 'isAdmin': isAdmin};
  }
}
