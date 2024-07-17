import 'package:mycash_front/model/chart_data.dart';
import 'package:mycash_front/model/datetime_data.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class Data {
  static List<Map<String, dynamic>> Ingresos = [];
  static List<Map<String, dynamic>> Egresos = [];

  static Future<void> fetchIngresos() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt('id') ?? 0;
      
      final response = await http.get(Uri.parse('http://10.0.2.2:3000/api/transactions/incomeSum/ByCategory/$userId'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        Ingresos = data.map((item) {
          return {
            'Titulo': item['Category']['name'] ?? 'N/A',
            'Monto': 'S/' + (item['total'] ?? 0).toString(),
          };
        }).toList();

        print('Ingresos cargados: $Ingresos');
      } else {
        print('Error en la solicitud de ingresos: ${response.statusCode}');
        throw Exception('Error al cargar los ingresos');
      }
    } catch (e) {
      print('Error de conexión al cargar ingresos: $e');
      throw Exception('Error de conexión: $e');
    }
  }

  static Future<void> fetchEgresos() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt('id') ?? 0;


      final response = await http.get(Uri.parse('http://10.0.2.2:3000/api/transactions/expenseSum/ByCategory/$userId'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        Egresos = data.map((item) {
          return {
            'Titulo': item['Category']['name'] ?? 'N/A',
            'Monto': 'S/' + (item['total'] ?? 0).toString(),
          };
        }).toList();

        print('Egresos cargados: $Egresos');
      } else {
        print('Error en la solicitud de egresos: ${response.statusCode}');
        throw Exception('Error al cargar los egresos');
      }
    } catch (e) {
      print('Error de conexión al cargar egresos: $e');
      throw Exception('Error de conexión: $e');
    }
  }

  static List<ChartData> resultados = [
    ChartData("ingresos", 3000, Colors.blue),
    ChartData("egresos", 2500, Colors.blue),
  ];

  static List<DatetimeData> resultadosConTiempo = [];
  static Future<void> fetchData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt('id') ?? 0;
      final ingresosResponse = await http.get(Uri.parse('http://10.0.2.2:3000/api/transactions/incomeSum/ByMonth/$userId'));
      final egresosResponse = await http.get(Uri.parse('http://10.0.2.2:3000/api/transactions/expenseSum/ByMonth/$userId'));

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
