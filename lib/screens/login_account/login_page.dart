import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import './login_controler.dart';

class LoginPage extends StatelessWidget {
  LoginController control = Get.put(LoginController());

  Widget _form(BuildContext context, bool isKeyBoardOpen) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.1, // Margen izquierdo
        MediaQuery.of(context).size.width *
            (isKeyBoardOpen ? 0.2 : 0.4), // Margen superior
        MediaQuery.of(context).size.width * 0.1, // Margen derecho
        MediaQuery.of(context).size.width * 0.1, // Margen inferior
      ),
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '¡Bienvenido de vuelta!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          'Correo Electrónico',
          style: TextStyle(
            height: 3,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        TextField(
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(20.0)), // Borde del campo de texto
            contentPadding: EdgeInsets.all(10),
          ),
          controller: control.userController,
        ),
        Text(
          'Contraseña',
          textAlign: TextAlign.left,
          style: TextStyle(
            height: 3,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        TextField(
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          decoration: InputDecoration(
            labelStyle:
                TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            contentPadding: EdgeInsets.all(10),
          ),
          controller: control.passController,
          obscureText: true,
        ),
        _links(context),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              control.login(context);
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.purple,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: Text(
              'Ingresar',
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
              ),
            ),
          ),
        ),
        Text(
          '¿Aún no tienes una cuenta? Regístrate',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
            height: 6,
          ),
        ),
      ]),
    );
  }

  Widget _links(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      padding: EdgeInsets.all(10),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.google,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(width: 50),
            FaIcon(
              FontAwesomeIcons.facebookF,
              color: Colors.white,
              size: 20,
            ), // Icono
            SizedBox(width: 50),
            FaIcon(
              FontAwesomeIcons.apple,
              color: Colors.white,
              size: 20,
            ),
          ],
        )
      ]),
    );
  }

  Widget _background(BuildContext context) {
    return Container(color: Color.fromARGB(255, 43, 46, 49));
  }

  Widget _imageBackground(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.cover)),
            ),
            flex: 1),
        Expanded(child: Text(''), flex: 1),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    final bool isKeyBoardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Stack(children: [
      _background(context),
      _imageBackground(context),
      _form(context, isKeyBoardOpen)
    ]);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: _buildBody(context)),
    );
  }
}
