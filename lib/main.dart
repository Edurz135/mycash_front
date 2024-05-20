import 'package:flutter/material.dart';
import 'package:mycash_front/screens/home_screen.dart';
import 'package:mycash_front/screens/login_account/login_page.dart';
import 'package:mycash_front/screens/profile/profile_screen.dart';
import 'package:mycash_front/screens/statistics_screen.dart';
import 'package:mycash_front/services/api_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'Login', home: LoginPage());
  }
}

