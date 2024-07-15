import './signin_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './signin_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SignInController control = Get.put(SignInController());
  bool _termsAccepted = false; // Estado del checkbox

  void _showTermsDialog() {
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
                  'Tiene que aceptar los Términos y Condiciones',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cerrar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _termsAndConditions() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: CheckboxListTile(
          title: Text(
            'Acepto los términos y condiciones',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          value: _termsAccepted,
          onChanged: (bool? newValue) {
            setState(() {
              _termsAccepted = newValue ?? false;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.purple,
          checkColor: Colors.white,
          contentPadding: EdgeInsets.zero, // Remove extra padding
        ),
      ),
    );
  }

  Widget _form(BuildContext context, bool isKeyBoardOpen) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.1, // Margen izquierdo
        MediaQuery.of(context).size.width * (isKeyBoardOpen ? 0.2 : 0.2), // Margen superior
        MediaQuery.of(context).size.width * 0.1, // Margen derecho
        MediaQuery.of(context).size.width * 0.0, // Margen inferior
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Correo Electrónico',
            textAlign: TextAlign.left,
            style: TextStyle(
              height: 3,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          TextField(
            controller: control.emailController,
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            ),
          ),
          Text(
            'Nombres',
            textAlign: TextAlign.left,
            style: TextStyle(
              height: 3,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          TextField(
            controller: control.nombresController,
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            ),
          ),
          Text(
            'Apellidos',
            textAlign: TextAlign.left,
            style: TextStyle(
              height: 3,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          TextField(
            controller: control.apellidoController,
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            ),
          ),
          Text(
            'Contraseña',
            textAlign: TextAlign.left,
            style: TextStyle(
              height: 3,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          TextField(
            controller: control.pws1Controller,
            obscureText: true,
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            ),
          ),
          Text(
            'Confirmar contraseña',
            textAlign: TextAlign.left,
            style: TextStyle(
              height: 3,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          TextField(
            controller: control.pws2Controller,
            obscureText: true,
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                _termsAndConditions(),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      if (_termsAccepted) {
                        control.createAccount(context);
                      } else {
                        _showTermsDialog();
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      'Registrar',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                _LoginUser(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _LoginUser(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: GestureDetector(
              onTap: () {
                control.goToLogIn(context);
              },
              child: Text.rich(
                TextSpan(
                  text: '¿Ya tienes cuenta? ',
                  style: TextStyle(
                    height: 3,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  children: [
                    TextSpan(
                      text: 'Ingresar',
                      style: TextStyle(
                        height: 3,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
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
                fit: BoxFit.cover,
              ),
            ),
          ),
          flex: 1,
        ),
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: _buildBody(context)),
    );
  }
}

