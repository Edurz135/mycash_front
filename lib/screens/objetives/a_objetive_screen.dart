import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mycash_front/screens/objetives/objetivos_viewmodel.dart';
import 'package:mycash_front/screens/objetives/b_objective_configuration_screen.dart';
import 'package:mycash_front/screens/objetives/c_detalle_objetivo_screen.dart';

class ObjetiveScreen extends StatefulWidget {
  const ObjetiveScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ObjetiveScreenState createState() => _ObjetiveScreenState();
}

class _ObjetiveScreenState extends State<ObjetiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ObjetivosViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Center(
              child: Text(
                'Objetivos', 
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            centerTitle: true, // Esto centra el título horizontalmente
            toolbarHeight: 120.0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF5986DF), Color(0xFFB156A8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: 
            Column(
              children: [
                Expanded(
                  child: viewModel.objetivos.isEmpty
                    ? const Center(
                        child: Text(
                          'No tienes ningún objetivo',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: viewModel.objetivos.length,
                        itemBuilder: (context, index) {
                          final objetivo = viewModel.objetivos[index];
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: objetivo.color,
                                child: Icon(
                                  objetivo.icono,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text(objetivo.nombre),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${objetivo.montoAhorrado} / ${objetivo.cantidadObjetivo}'),
                                  LinearProgressIndicator(
                                    value: objetivo.montoAhorrado / objetivo.cantidadObjetivo,
                                    backgroundColor: Colors.white,
                                    valueColor: AlwaysStoppedAnimation<Color>(objetivo.color),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetalleObjetivoScreen(objetivo: objetivo),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CrearObjetivoScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF9C42C6), Color(0xFFE38466)],
                      ),
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 80.0, minHeight: 40.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'Crear nuevo objetivo',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          )
        );
      }
    );
  }
}