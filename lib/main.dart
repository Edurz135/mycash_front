import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycash_front/screens/objective_screens/a_objective_screen.dart';
import 'package:mycash_front/services/api_config.dart';
import 'package:mycash_front/components/BottomNavBar.dart';
import 'package:mycash_front/screens/login_account/login_page.dart';

void main() {
  APIConfig.setEnvironment(Environment.development); // or Environment.production
  runApp(const MainLayout());
}

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyCash',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      home: LoginPage(),
    );
  }
}
