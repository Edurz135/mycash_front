import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:mycash_front/model/User.dart';
//import '../home_screen.dart';
import 'package:mycash_front/components/BottomNavBar.dart';
import 'package:mycash_front/screens/signin_account/signin_page.dart';

class LoginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  List<User> users = [
    User(
      id: 1,
      name: 'Jesús',
      lastname: 'Lujan',
      email: 'asdf',
      password: '1234',
      creationDate: DateTime.now(),
      modifiedDate: DateTime.now(),
      active: true,
    ),
  ];

  void login(BuildContext context) {
    String em = userController.text;
    String psw = passController.text;
    bool found = false;
    User userLogged = User.empty();
    for (User u in this.users) {
      if (u.email == em && u.password == psw) {
        found = true;
        userLogged = u;
      }
    }
    if (found) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBar()),
      );
    } else {
      print('error: usuario incorrecto');
    }

  }

  void goToSignIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInPage()),
    );
  }
}