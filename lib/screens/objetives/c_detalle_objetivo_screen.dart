//detalle_objetivo_screen.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

import 'package:mycash_front/screens/objetives/objetivo.dart';
import 'package:mycash_front/screens/objetives/objetivos_viewmodel.dart';

class DetalleObjetivoScreen extends StatefulWidget {
  final Objetivo objetivo;

  DetalleObjetivoScreen({required this.objetivo});

  @override
  _DetalleObjetivoScreenState createState() => _DetalleObjetivoScreenState();
}

class _DetalleObjetivoScreenState extends State<DetalleObjetivoScreen> {
  void _agregarAhorro() async {
    final TextEditingController _controller = TextEditingController();
    double? monto;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Agregar Ahorro'),
          content: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Ingrese la cantidad a ahorrar"),
            onChanged: (value) {
              monto = double.tryParse(value);
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Agregar'),
              onPressed: () {
                if (monto != null && monto! > 0) {
                  setState(() {
                    widget.objetivo.agregarAhorro(monto!);
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _eliminarObjetivo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Eliminar Objetivo'),
          content: Text('¿Estás seguro de que deseas eliminar este objetivo?'),
          actions: [
            TextButton(
              onPressed: () {
                Provider.of<ObjetivosViewModel>(context, listen: false).eliminarObjetivo(widget.objetivo);
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Volvemos atrás dos veces para cerrar esta pantalla y la anterior
              },
              child: Text('Eliminar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.objetivo.nombre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 300, // Ajusta según sea necesario
              child: Stack(
                children: [
                  PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          color: Colors.green,
                          value: widget.objetivo.montoAhorrado,
                          title: '',
                          radius: 70,
                        ),
                        PieChartSectionData(
                          color: Colors.red,
                          value: widget.objetivo.cantidadObjetivo - widget.objetivo.montoAhorrado,
                          title: '',
                          radius: 70,
                        ),
                      ],
                      sectionsSpace: 0,
                      centerSpaceRadius: 80, // Ajusta el tamaño del centro
                    ),
                    swapAnimationDuration: Duration(milliseconds: 150), // Animación al interactuar
                    swapAnimationCurve: Curves.linear, // Curva de la animación al interactuar
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Monto ahorrado',
                          style: TextStyle(
                            color: Colors.black, // Cambiar color del texto central
                            fontSize: 16, // Ajusta el tamaño del texto central
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'S/.${widget.objetivo.montoAhorrado.toStringAsFixed(2)} / S/.${widget.objetivo.cantidadObjetivo.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.black, // Cambiar color del texto central
                            fontSize: 14, // Ajusta el tamaño del texto central
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10), // Separación entre el gráfico y la leyenda
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.green,
                ),
                SizedBox(width: 5),
                Text('Ahorrado'),
                SizedBox(width: 20),
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.red,
                ),
                SizedBox(width: 5),
                Text('Faltante'),
              ],
            ),
            ElevatedButton(
              onPressed: _agregarAhorro,
              child: Text('Agregar Ahorros'),
            ),
            ElevatedButton(
              onPressed: () => _eliminarObjetivo(context),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red), // Cambia el color del botón a rojo
              child: Text('Eliminar Objetivo'),
            ),
          ],
        ),
      ),
    );
  }
}
