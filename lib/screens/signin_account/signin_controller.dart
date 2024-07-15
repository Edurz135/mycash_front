import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mycash_front/screens/login_account/login_page.dart';
import 'package:mycash_front/services/auth.service.dart';
import 'package:mycash_front/services/api_config.dart';

class SignInController extends GetxController {
  TextEditingController nombresController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pws1Controller = TextEditingController();
  TextEditingController pws2Controller = TextEditingController();

  void createAccount(BuildContext context) async {
    String firstName = nombresController.text;
    String lastName = apellidoController.text;
    String email = emailController.text;
    String password = pws1Controller.text;
    String confirmPassword = pws2Controller.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      final response = await AuthService.signup(firstName, lastName, email, password);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User was registered successfully!')),
      );
      _UserCreatedSuccess(context);
      print('CORRECTO GA');
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
      print('INCORRECTO PIPI');
    }
  }

  void _UserCreatedSuccess(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Usuario creado exitosamente',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Aceptar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void goToLogIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}