import 'package:mycash_front/model/chart_data.dart';
import 'package:mycash_front/model/datetime_data.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Data{
  static List<Map<String, String>> Ingresos =[
    {'Titulo': 'Compras', 'Monto':'S/'+'1.400'},
    {'Titulo': 'Banco', 'Monto':'S/'+'1.400'},
    {'Titulo': 'Educacion', 'Monto':'S/'+'1.400'},
    {'Titulo': 'Guardados', 'Monto':'S/'+'1.400'},
    {'Titulo': 'Academia', 'Monto':'S/'+'5.400'},
  ];

  static List<Map<String, String>> Egresos = [
    {'Titulo': 'Renta', 'Monto': 'S/'+'900'},
    {'Titulo': 'Servicios', 'Monto': 'S/'+'300'},
    {'Titulo': 'Transporte', 'Monto': 'S/'+'200'},
    {'Titulo': 'Comida', 'Monto': 'S/'+'400'},
  ];

  static List<ChartData> resultados = [
    ChartData("ingresos", 3000, Colors.blue),
    ChartData("egresos", 2500, Colors.blue),
  ];

  static List<DatetimeData> resultadosConTiempo = [];
  static Future<void> fetchData() async {
    try {
      final ingresosResponse = await http.get(Uri.parse('http://10.0.2.2:3000/api/transactions/incomeSum/ByMonth/2'));
      final egresosResponse = await http.get(Uri.parse('http://10.0.2.2:3000/api/transactions/expenseSum/ByMonth/2'));

      if (ingresosResponse.statusCode == 200 && egresosResponse.statusCode == 200) {
        final ingresosData = Map<String, dynamic>.from(json.decode(ingresosResponse.body));
        final egresosData = Map<String, dynamic>.from(json.decode(egresosResponse.body));

        resultadosConTiempo = ingresosData.keys.map((key) {
          final yearMonth = key.split('-');
          final year = int.parse(yearMonth[0]);
          final month = int.parse(yearMonth[1]);
          final ingresos = ingresosData[key] as num;
          final egresos = -1 * egresosData[key] as num? ?? 0;

          return DatetimeData(DateTime(year, month), [ingresos, egresos]);
        }).toList();

        print('Datos cargados: $resultadosConTiempo'); // Verifica los datos cargados
      } else {
        print('Error en la solicitud: ${ingresosResponse.statusCode}, ${egresosResponse.statusCode}');
        throw Exception('Error al cargar los datos');
      }
    } catch (e) {
      print('Error de conexión: $e');
      throw Exception('Error de conexión: $e');
    }
  }
}

