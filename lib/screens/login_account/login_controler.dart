import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:mycash_front/model/User.dart';
//import '../home_screen.dart';
import 'package:mycash_front/components/BottomNavBar.dart';
import 'package:mycash_front/screens/signin_account/signin_page.dart';
import 'package:mycash_front/services/auth.service.dart';



class LoginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();


  void login(BuildContext context) async {
    String email = userController.text;
    String password = passController.text;

    try {
      final userData = await AuthService.signIn(email, password);
      if (userData != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavBar()),
        );
      } else {
        print('Error: Incorrect user credentials');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }


  void goToSignIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInPage()),
    );
  }
}