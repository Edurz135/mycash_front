//objetivos_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:mycash_front/screens/objetives/objetivo.dart';

class ObjetivosViewModel extends ChangeNotifier {
  List<Objetivo> _objetivos = [];

  List<Objetivo> get objetivos => _objetivos;

  void agregarObjetivo(Objetivo objetivo) {
    _objetivos.add(objetivo);
    notifyListeners();
  }

  void eliminarObjetivo(Objetivo objetivo) {
    _objetivos.remove(objetivo);
    notifyListeners();
  }
}
