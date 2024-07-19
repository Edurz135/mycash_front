import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mycash_front/model/objective_model.dart';
import 'package:mycash_front/services/api_config.dart';

class ObjectiveService {
  static Future<List<Objective>> fetchObjectives() async {
    final url = Uri.parse('${APIConfig.baseURL}objectives/');
    print("Calling API: GET $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${await APIConfig.getToken()}'},
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print("API Response: ${response.body}");
      return data.map((json) => Objective.fromJson(json)).toList();
    } else {
      print("API Error: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception('Failed to load objectives');
    }
  }

  static Future<Objective> fetchObjectiveById(int id) async {
    final url = Uri.parse('${APIConfig.baseURL}objectives/$id');
    print("Calling API: GET $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${ await APIConfig.getToken()}'},
    );
    if (response.statusCode == 200) {
      print("API Response: ${response.body}");
      return Objective.fromJson(json.decode(response.body));
    } else {
      print("API Error: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception('Failed to load objective');
    }
  }

  static Future<void> createObjective(
    String name,
    double targetAmount,
    double currentAmount,
    IconData iconName, 
    Color colorName, 
    DateTime deadline,
  ) async {
    final url = Uri.parse('${APIConfig.baseURL}objectives/');
    print("Calling API: POST $url");
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${ await APIConfig.getToken()}',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'objective_name': name,
        'target_amount': targetAmount,
        'current_amount': currentAmount,
        'icon_name': iconName.codePoint.toString(),
        'color_name': colorName.value.toString(),
        'deadline': deadline.toIso8601String(),
      }),
    );
    if (response.statusCode == 200) {
      print("API Response: ${response.body}");
    } else {
      print("API Error: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception('Failed to create objective');
    }
  }

  static Future<void> deleteObjective(int id) async {
    final url = Uri.parse('${APIConfig.baseURL}objectives/$id');
    print("Calling API: DELETE $url");
    final response = await http.delete(
      url,
      headers: {'Authorization': 'Bearer ${ await APIConfig.getToken()}'},
    );
    if (response.statusCode == 200) {
      print("API Response: ${response.body}");
    } else {
      print("API Error: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception('Failed to delete objective');
    }
  }

  static Future<void> addAmountToObjective(int id, double amount) async {
    final url = Uri.parse('${APIConfig.baseURL}objectives/$id/addAmount');
    print("Calling API: PUT $url");
    final response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer ${await APIConfig.getToken()}',
        'Content-Type': 'application/json',
      },
      body: json.encode({'monto': amount}),
    );
    if (response.statusCode == 200) {
      print("API Response: ${response.body}");
    } else {
      print("API Error: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception('Failed to add amount to objective');
    }
  }

  static Future<String> viewObjectiveProgress(int id) async {
    final url = Uri.parse('${APIConfig.baseURL}objectives/$id/progress');
    print("Calling API: GET $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${ await APIConfig.getToken()}'},
    );
    if (response.statusCode == 200) {
      print("API Response: ${response.body}");
      final progress = json.decode(response.body)['progress'];
      return progress;
    } else {
      print("API Error: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception('Failed to view objective progress');
    }
  }
}
