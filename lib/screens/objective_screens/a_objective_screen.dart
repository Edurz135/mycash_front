import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mycash_front/screens/objective_screens/objective_viewmodel.dart';
import 'package:mycash_front/screens/objective_screens/b_objective_configuration_screen.dart';
import 'package:mycash_front/screens/objective_screens/c_detail_objective_screen.dart';

class ObjetiveScreen extends StatefulWidget {
  const ObjetiveScreen({Key? key}) : super(key: key);

  @override
  _ObjetiveScreenState createState() => _ObjetiveScreenState();
}

class _ObjetiveScreenState extends State<ObjetiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ObjectivesViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: const Center(
              child: Text(
                'Objetivos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            toolbarHeight: 100.0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF5986DF), Color(0xFFB156A8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: viewModel.objectives.isEmpty
                      ? const Center(
                          child: Text(
                            'No tienes ningún objetivo',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          itemCount: viewModel.objectives.length,
                          itemBuilder: (context, index) {
                            final objective = viewModel.objectives[index];
                            return Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: objective.color,
                                  child: Icon(
                                    objective.icon,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Text(objective.name),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${objective.savedAmount} / ${objective.targetAmount}',
                                    ),
                                    LinearProgressIndicator(
                                      value: objective.savedAmount /
                                          objective.targetAmount,
                                      backgroundColor: Colors.white,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          objective.color),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetalleObjetivoScreen(
                                        objective: objective,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateObjectiveScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF9C42C6), Color(0xFFE38466)],
                      ),
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(
                          minWidth: 80.0, minHeight: 40.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'Crear nuevo objetivo',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
