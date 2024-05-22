import 'package:mycash_front/model/chart_data.dart';
import 'package:mycash_front/model/datetime_data.dart';
import 'package:flutter/material.dart';
import 'package:mycash_front/model/objetive_category_data.dart';
class Data{
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

