import 'package:mycash_front/model/chart_data.dart';
import 'package:mycash_front/model/datetime_data.dart';
import 'package:flutter/material.dart';
import 'package:mycash_front/model/objetive_category_data.dart';
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

  static List<DatetimeData> resultadosConTiempo = [
    DatetimeData(DateTime(2024, 1), [3000, 2500]),
    DatetimeData(DateTime(2024, 2), [4000, 2100]),
    DatetimeData(DateTime(2024, 3), [3500, 2000]),
    DatetimeData(DateTime(2024, 4), [3600, 3000]),
    DatetimeData(DateTime(2024, 5), [2200, 1900])
  ];

  static List<ObjectiveCategoryData> objetivosPredeterminados = [
    ObjectiveCategoryData('Casa Nueva', Icons.home),
    ObjectiveCategoryData('Celular Nuevo', Icons.smartphone),
    ObjectiveCategoryData('Viaje', Icons.flight),
    ObjectiveCategoryData('Educación', Icons.school),
    ObjectiveCategoryData('Automóvil', Icons.directions_car),
    ObjectiveCategoryData('Negocio', Icons.business),
    ObjectiveCategoryData('Mascota', Icons.catching_pokemon),
  ];
}

