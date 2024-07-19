import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mycash_front/model/transaction.dart';
import 'package:mycash_front/services/api_config.dart';

class TransactionService{
  static Future<List<Transaction>> fetchTransactions() async {
    final url = Uri.parse('${APIConfig.baseURL}transactions/');
    print("Calling API: GET $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${ await APIConfig.getToken()}'},
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print("API Response: ${response.body}");
      return data.map((json) => Transaction.fromJson(json)).toList();
    } else {
      print("API Error: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception('Failed to load Transaction');
    }
  }

  static Future<void> editTransaction(Transaction transaction) async {
    final url = Uri.parse('${APIConfig.baseURL}transactions/${transaction.id}');
    print("Calling API: PUT $url");
    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${ await APIConfig.getToken()}',
      },
      body: json.encode(transaction.toJson()),
    );
    if (response.statusCode == 200) {
      print("API Response: ${response.body}");
    } else {
      print("API Error: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception('Failed to edit transaction');
    }
  }

  static Future<void> deleteTransaction(int id) async {
    final url = Uri.parse('${APIConfig.baseURL}transactions/$id');
    print("Calling API: DELETE $url");
    final response = await http.delete(
      url,
      headers: {'Authorization': 'Bearer ${ await APIConfig.getToken()}'},
    );
    if (response.statusCode == 200) {
      print("API Response: ${response.body}");
    } else {
      print("API Error: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception('Failed to delete transaction');
    }

  }
  static Future<bool> transfer(int fromId, int toId, double amount) async {
    Map<String, dynamic> requestBody = {
      'fromAccountId': fromId,
      'toAccountId': toId,
      'amount': amount
    };
    final url = Uri.parse('${APIConfig.baseURL}transfer/waza/');
    debugPrint("Calling API: Transfer $url");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );
    if (response.statusCode == 200) {
      debugPrint("RESPONSE: ${response.body}");
      return true;
    } else {
      throw Exception('Error on api call: ${response.body}');
    }
  }
}