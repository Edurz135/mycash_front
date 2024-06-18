import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mycash_front/screens/objetives/objetivos_viewmodel.dart';
import 'package:mycash_front/services/api_config.dart';
import 'package:mycash_front/components/BottomNavBar.dart';
import 'package:mycash_front/screens/login_account/login_page.dart';

void main() {
  APIConfig.setEnvironment(
      Environment.development); // or Environment.production
  runApp(const MainLayout());
}

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ObjetivosViewModel(),
      child: MaterialApp(
        title: 'MyCash',
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: LoginPage(),
      )
    );
  }
}

