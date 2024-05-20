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
            (isKeyBoardOpen ? 0.2 : 0.3), // Margen superior
        MediaQuery.of(context).size.width * 0.1, // Margen derecho
        MediaQuery.of(context).size.width * 0.1, // Margen inferior
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '¡Bienvenido de vuelta!',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'Correo Electrónico',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
                height: 3,
              ),
            ),
            TextField(
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 255, 255, 255),),
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        20.0)), // Borde del campo de texto
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
              controller: control.userController,
            ),
            Text(
              'Contraseña',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
                height: 3,
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
                    borderRadius: BorderRadius.circular(
                        20.0)), // Borde del campo de texto
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
              controller: control.passController,
              obscureText: true,
            ),
            SizedBox(
              height: 25,
            ),
            _links(context),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity, // Ocupar todo el ancho disponible
              child: TextButton(
                onPressed: () {
                  // Función que se ejecuta cuando se presiona el botón
                  control.login(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.purple, // Color de fondo del botón
                  padding: EdgeInsets
                      .zero, // Padding cero para eliminar el espacio interno
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Bordes cero para eliminar los bordes
                  ),
                ),
                child: Text(
                  'Ingresar',
                  style: TextStyle(
                    color: const Color.fromARGB(
                        255, 255, 255, 255), // Color del texto
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Obx(() => Text(
                  control.message.value,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: control.messageColor.value,
                  ),
                )),

            Text(
              '¿Aún no tienes una cuenta? Regístrate',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
                height: 6,
              ),
            ),
          ])
        ],
      ),
    );
  }

  Widget _links(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.google, // Icono de Google de Font Awesome
              color: Colors.white, // Color del icono
              size: 20, // Tamaño del icono
            ), // Icono
            SizedBox(width: 50), // Espacio entre el icono y el texto
            FaIcon(
              FontAwesomeIcons.facebookF, // Icono de Google de Font Awesome
              color: Colors.white, // Color del icono
              size: 20, // Tamaño del icono
            ), // Icono
            SizedBox(width: 50),
            FaIcon(
              FontAwesomeIcons.apple, // Icono de Google de Font Awesome
              color: Colors.white, // Color del icono
              size: 20, // Tamaño del icono
            ), // Icono
            SizedBox(width: 50),
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
    print('1 +++++++++++++++++++++++++');
    print(isKeyBoardOpen);
    print('2 +++++++++++++++++++++++++');
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