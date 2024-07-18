import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mycash_front/model/objective_model.dart';
import 'package:mycash_front/services/api_config.dart';

class ObjectiveService {
  static Future<List<Objective>> fetchObjectives() async {
    final url = Uri.parse('${APIConfig.baseURL}objectives/');
    print("Calling API: GET $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${APIConfig.token}'},
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
      headers: {'Authorization': 'Bearer ${APIConfig.token}'},
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
    String iconName,
    String colorName,
    DateTime deadline,
    int currencyTypeId,
  ) async {
    final url = Uri.parse('${APIConfig.baseURL}objectives/');
    print("Calling API: POST $url");
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${APIConfig.token}',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'objective_name': name,
        'target_amount': targetAmount,
        'current_amount': currentAmount,
        'icon_name': iconName,
        'color_name': colorName,
        'deadline': deadline.toIso8601String(),
        'currencyTypeId': currencyTypeId,
      }),
    );
    if (response.statusCode == 200) {
      print("API Response: ${response.body}");
    } else {
      print("API Error: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception('Failed to create objective');
    }
  }

  static Future<void> updateObjective(
    int id,
    String name,
    double targetAmount,
    String iconName,
    String colorName,
    DateTime deadline,
    int currencyTypeId,
  ) async {
    final url = Uri.parse('${APIConfig.baseURL}objectives/$id');
    print("Calling API: PUT $url");
    final response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer ${APIConfig.token}',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'objective_name': name,
        'target_amount': targetAmount,
        'icon_name': iconName,
        'color_name': colorName,
        'deadline': deadline.toIso8601String(),
        'currencyTypeId': currencyTypeId,
      }),
    );
    if (response.statusCode == 200) {
      print("API Response: ${response.body}");
    } else {
      print("API Error: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception('Failed to update objective');
    }
  }

  static Future<void> deleteObjective(int id) async {
    final url = Uri.parse('${APIConfig.baseURL}objectives/$id');
    print("Calling API: DELETE $url");
    final response = await http.delete(
      url,
      headers: {'Authorization': 'Bearer ${APIConfig.token}'},
    );
    if (response.statusCode == 200) {
      print("API Response: ${response.body}");
    } else {
      print("API Error: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception('Failed to delete objective');
    }
  }

  static Future<void> deleteAllObjectives() async {
    final url = Uri.parse('${APIConfig.baseURL}objectives');
    print("Calling API: DELETE $url");
    final response = await http.delete(
      url,
      headers: {'Authorization': 'Bearer ${APIConfig.token}'},
    );
    if (response.statusCode == 200) {
      print("API Response: ${response.body}");
    } else {
      print("API Error: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception('Failed to delete all objectives');
    }
  }

  static Future<void> addAmountToObjective(int id, double amount) async {
    final url = Uri.parse('${APIConfig.baseURL}objectives/$id/addAmount');
    print("Calling API: PUT $url");
    final response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer ${APIConfig.token}',
        'Content-Type': 'application/json',
      },
      body: json.encode({'amount': amount}),
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
      headers: {'Authorization': 'Bearer ${APIConfig.token}'},
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
