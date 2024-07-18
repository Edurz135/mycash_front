import 'package:flutter/material.dart';
import 'package:mycash_front/model/objective_model.dart';
import 'package:mycash_front/services/objectives_service.dart';

class ObjectivesViewModel extends ChangeNotifier {
  List<Objective> _objectives = [];

  List<Objective> get objectives => _objectives;

  ObjectivesViewModel() {
    fetchObjectives();
  }

  Future<void> fetchObjectives() async {
    try {
      _objectives = await ObjectiveService.fetchObjectives();
      notifyListeners();
    } catch (error) {
      print("Failed to fetch objectives: $error");
    }
  }

  Future<void> addObjective(Objective objective) async {
    try {
      await ObjectiveService.createObjective(
        objective.name,
        objective.targetAmount,
        objective.savedAmount,
        objective.icon.toString(),
        objective.color.value.toRadixString(16),
        objective.deadline,
        1, // Reemplaza con el ID de la moneda si es necesario
      );
      _objectives.add(objective);
      notifyListeners();
    } catch (error) {
      print("Failed to add objective: $error");
    }
  }

  Future<void> removeObjective(Objective objective) async {
    try {
      await ObjectiveService.deleteObjective(objective.id);
      _objectives.remove(objective);
      notifyListeners();
    } catch (error) {
      print("Failed to remove objective: $error");
    }
  }

  Future<void> updateObjective(Objective objective) async {
    try {
      await ObjectiveService.updateObjective(
        objective.id,
        objective.name,
        objective.targetAmount,
        objective.icon.toString(),
        objective.color.value.toRadixString(16),
        objective.deadline,
        1, // Reemplaza con el ID de la moneda si es necesario
      );
      int index = _objectives.indexWhere((obj) => obj.id == objective.id);
      if (index != -1) {
        _objectives[index] = objective;
        notifyListeners();
      }
    } catch (error) {
      print("Failed to update objective: $error");
    }
  }

  Future<void> deleteAllObjectives() async {
    try {
      await ObjectiveService.deleteAllObjectives();
      _objectives.clear();
      notifyListeners();
    } catch (error) {
      print("Failed to delete all objectives: $error");
    }
  }

  Future<void> addAmountToObjective(int id, double amount) async {
    try {
      await ObjectiveService.addAmountToObjective(id, amount);
      int index = _objectives.indexWhere((obj) => obj.id == id);
      if (index != -1) {
        _objectives[index].savedAmount += amount;
        notifyListeners();
      }
    } catch (error) {
      print("Failed to add amount to objective: $error");
    }
  }

  Future<String> viewObjectiveProgress(int id) async {
    try {
      return await ObjectiveService.viewObjectiveProgress(id);
    } catch (error) {
      print("Failed to view objective progress: $error");
      return '0%';
    }
  }
}
