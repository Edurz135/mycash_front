import 'package:flutter/material.dart';

class Objective {
  int id;
  String name;
  double targetAmount;
  double savedAmount;
  DateTime deadline;
  DateTime createdAt;
  DateTime updatedAt;
  Color color;
  IconData icon;

  Objective({
    required this.id,
    required this.name,
    required this.targetAmount,
    required this.savedAmount,
    required this.deadline,
    required this.createdAt,
    required this.updatedAt,
    required this.color,
    required this.icon,
  });

  void addSavings(double amount) {
    savedAmount += amount;
  }

  factory Objective.fromJson(Map<String, dynamic> json) {
    return Objective(
      id: json['id'],
      name: json['name'],
      targetAmount: json['targetAmount'].toDouble(),
      savedAmount: json['savedAmount'].toDouble(),
      deadline: DateTime.parse(json['deadline']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      color: Color(int.parse(json['color'])),
      icon: IconData(int.parse(json['icon']), fontFamily: 'MaterialIcons'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'targetAmount': targetAmount,
      'savedAmount': savedAmount,
      'deadline': deadline.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'color': color.value.toRadixString(16), // Convierte el color a un string hexadecimal
      'icon': icon.codePoint, // Convierte el icono a un entero
    };
  }
}
