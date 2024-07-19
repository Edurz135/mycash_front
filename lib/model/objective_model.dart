import 'package:flutter/material.dart';

class Objective {
  int id;
  String name;
  double targetAmount;
  double savedAmount;
  int userId;
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
    required this.userId,
    required this.deadline,
    required this.createdAt,
    required this.updatedAt,
    required this.color,
    required this.icon,
  });

  factory Objective.fromJson(Map<String, dynamic> json) {
    return Objective(
      id: json['id'] ?? 0,
      name: json['objective_name'] ?? '',
      targetAmount: (json['target_amount'] as num?)?.toDouble() ?? 0.0,
      savedAmount: (json['current_amount'] as num?)?.toDouble() ?? 0.0,
      userId: json['userId'] ?? 0,
      deadline: DateTime.parse(json['deadline']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      color: json['color_name'] != null ? Color(int.parse(json['color_name'])) : Colors.transparent,
      icon: json['icon_name'] != null ? IconData(int.parse(json['icon_name']), fontFamily: 'MaterialIcons') : Icons.error,
    );
  }
}
