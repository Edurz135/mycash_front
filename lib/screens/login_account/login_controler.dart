import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:mycash_front/model/User.dart';
import '../home_screen.dart';

class LoginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  List<User> users = [
    User(
      id: 1,
      name: 'Jesús',
      lastname: 'Lujan',
      email: 'chocolatada@gmail.com',
      password: '1234',
      creationDate: DateTime.now(),
      modifiedDate: DateTime.now(),
      active: true,
    ),
  ];

  void login(BuildContext context) {
    print('hola desde el controlador');
    print(userController.text);
    print(passController.text);
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
      print('usuario correcto');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      print('error: usuario incorrecto');
    }

    /*
    Future.delayed(Duration(seconds: 5), () {
      message.value = '';
    });

    */
  }
}
