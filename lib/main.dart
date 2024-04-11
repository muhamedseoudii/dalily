import 'package:dalily/src/app_root.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? pref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await initSharedPreferences();
  runApp(const AppRoot());
}

Future<SharedPreferences> initSharedPreferences() async {
  return await SharedPreferences.getInstance();
}
