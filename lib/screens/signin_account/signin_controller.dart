import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mycash_front/screens/login_account/login_page.dart';

class SignInControler extends GetxController{
    TextEditingController nombresController = TextEditingController();
    TextEditingController apellidoController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController pws1Controller = TextEditingController();
    TextEditingController pws2Controller = TextEditingController();

    void createAccount() {
        print('falta createAccount');
    }
    void goToLogIn(BuildContext context) {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        );
    } 
}