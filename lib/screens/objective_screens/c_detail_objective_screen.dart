import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:mycash_front/model/objective_model.dart';
import 'package:mycash_front/screens/objective_screens/objective_screen_controller.dart';

class DetalleObjetivoScreen extends StatefulWidget {
  final Objective objective;

  DetalleObjetivoScreen({required this.objective});

  @override
  _DetalleObjetivoScreenState createState() => _DetalleObjetivoScreenState();
}

class _DetalleObjetivoScreenState extends State<DetalleObjetivoScreen> {
  final ObjectiveController _controller = Get.find();

  void _agregarAhorro() async {
    final TextEditingController _amountController = TextEditingController();
    double? amount;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Agregar Ahorro'),
          content: TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Ingrese la cantidad a ahorrar"),
            onChanged: (value) {
              amount = double.tryParse(value);
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
                if (amount != null && amount! > 0) {
                  _controller.addAmountToObjective(widget.objective.id, amount!).then((_) {
                    setState(() {
                      widget.objective.savedAmount += amount!;
                    });
                    Navigator.of(context).pop();
                  }).catchError((error) {
                    // Manejar error
                    print("Failed to add amount: $error");
                  });
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
                _controller.deleteObjective(widget.objective.id);
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.objective.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 350, // Ajusta según sea necesario
              child: Stack(
                children: [
                  PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          color: Colors.green,
                          value: widget.objective.savedAmount,
                          title: '',
                          radius: 70,
                        ),
                        PieChartSectionData(
                          color: Colors.red,
                          value: widget.objective.targetAmount - widget.objective.savedAmount,
                          title: '',
                          radius: 70,
                        ),
                      ],
                      sectionsSpace: 0,
                      centerSpaceRadius: 100, // Ajusta el tamaño del centro
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
                            color: Colors.white, // Cambiar color del texto central
                            fontSize: 16, // Ajusta el tamaño del texto central
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'S/.${widget.objective.savedAmount.toStringAsFixed(2)} / S/.${widget.objective.targetAmount.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.white, // Cambiar color del texto central
                            fontSize: 14, // Ajusta el tamaño del texto central
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
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _agregarAhorro,
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
                  constraints: const BoxConstraints(minWidth: 20.0, minHeight: 40.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Agregar ahorro',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _eliminarObjetivo(context),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color.fromARGB(255, 236, 3, 3), Color.fromARGB(255, 0, 0, 0)],
                  ),
                  borderRadius: BorderRadius.circular(80.0),
                ),
                child: Container(
                  constraints: const BoxConstraints(minWidth: 20.0, minHeight: 40.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Eliminar objetivo',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
