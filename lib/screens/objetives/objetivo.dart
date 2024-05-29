//objetivo.dart
import 'package:flutter/material.dart';

class Objetivo {
  String nombre;
  double cantidadObjetivo;
  double montoAhorrado;
  DateTime fechaLimite;
  Color color;
  IconData icono;

  Objetivo({
    required this.nombre,
    required this.cantidadObjetivo,
    required this.montoAhorrado,
    required this.fechaLimite,
    required this.color,
    required this.icono,
  });

  void agregarAhorro(double monto) {
    montoAhorrado += monto;
  }
}
