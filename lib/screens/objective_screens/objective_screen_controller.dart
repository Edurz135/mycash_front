import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycash_front/model/objective_model.dart';
import 'package:mycash_front/services/objectives_service.dart';

class ObjectiveController extends GetxController {
  var objectives = <Objective>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchObjectives();
  }

  Future<void> fetchObjectives() async {
    try {
      final fetchedObjectives = await ObjectiveService.fetchObjectives();
      objectives.assignAll(fetchedObjectives);
    } catch (error) {
      print('Failed to fetch objectives: $error');
    }
  }

  Future<void> createObjective(
    String name,
    double targetAmount,
    double currentAmount,
    DateTime deadline,
    Color color,
    IconData icon,
  ) async {
    try {
      await ObjectiveService.createObjective(
        name,
        targetAmount,
        currentAmount,
        icon,
        color,
        deadline,
      );
      fetchObjectives();
    } catch (error) {
      print('Failed to create objective: $error');
    }
  }

  Future<void> deleteObjective(int id) async {
    try {
      await ObjectiveService.deleteObjective(id);
      fetchObjectives();
    } catch (error) {
      print('Failed to delete objective: $error');
    }
  }

  Future<void> addAmountToObjective(int id, double amount) async {
    try {
      await ObjectiveService.addAmountToObjective(id, amount);
      fetchObjectives();
    } catch (error) {
      print('Failed to add amount to objective: $error');
    }
  }

  Future<String> viewObjectiveProgress(int id) async {
    try {
      final progress = await ObjectiveService.viewObjectiveProgress(id);
      return progress;
    } catch (error) {
      print('Failed to view objective progress: $error');
      return '';
    }
  }
}
