import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycash_front/screens/profile/profile_screen_controller.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileScreenController controller = Get.put(ProfileScreenController());

  @override
  void initState() {
    super.initState();
    controller.fetchAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromRGBO(89, 134, 223, 1), Color.fromRGBO(177, 86, 168, 1)],
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 16),
              CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/profilepic.png')),
              SizedBox(height: 16),
              Text('Bienvenido', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Obx(() => Text(
                controller.accounts.isNotEmpty ? 'User ID: ${controller.accounts[0].userId}' : 'No Accounts',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              )),
              SizedBox(height: 16),
            ],
          ),
        ),
        SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(color: Color(0xFF1C1E24), borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nombre:', style: TextStyle(fontSize: 18, color: Color(0xFFFFFFFF))),
                  SizedBox(width: 18),
                  Obx(() => Text(
                    controller.accounts.isNotEmpty ? 'User ID: ${controller.accounts[0].userId}' : 'No Account Name',
                    style: TextStyle(fontSize: 18, color: Color(0xFF828087)),
                  )),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
              SizedBox(height: 22),
              _buildMenuItem('Ayuda y soporte', Icons.arrow_forward),
              SizedBox(height: 22),
              _buildMenuItem('Configuración', Icons.arrow_forward),
              SizedBox(height: 22),
              _buildMenuItem('Cerrar sesión', Icons.arrow_forward),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(String text, IconData icon) {
    return InkWell(
      onTap: () {
        // Lógica para manejar la navegación
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(fontSize: 18, color: Color(0xFFFFFFFF))),
          Icon(icon, color: Colors.white),
        ],
      ),
    );
  }
}
