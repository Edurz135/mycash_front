import 'package:flutter/material.dart';
import 'package:mycash_front/screens/transaction_detail_screen/transaction_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:mycash_front/screens/objective_screens/objective_viewmodel.dart';
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
      create: (context) => ObjectivesViewModel(),
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

