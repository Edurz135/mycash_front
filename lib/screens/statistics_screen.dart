import 'package:flutter/material.dart';
import 'package:mycash_front/components/stacked_line_sync_fusion_content.dart';
import 'package:mycash_front/data/data.dart';
class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  String? _dropdownValue;
  String selectedCategory = 'Ingresos';

  @override
  Widget build(BuildContext context) {
    void dropdownCallBack(String? selectedValue) {
      if (selectedValue is String) {
        setState(() {
          _dropdownValue = selectedValue;
        });
      }
    }

    return FutureBuilder(
      future: Data.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: double.infinity, // Full width of the screen
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(89, 134, 223, 1),
                        Color.fromRGBO(177, 86, 168, 1),
                      ],
                    ),
                  ),
                  child: const Column(
                    children: [
                      SizedBox(height: 43), // Add spacing
                      Text(
                        'Estadísticas',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 43), // Add spacing
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButton(
                  items: const [
                    DropdownMenuItem(child: Text("Mensual"), value: "Mensual"),
                    DropdownMenuItem(child: Text("Anual"), value: "Anual"),
                  ],
                  value: _dropdownValue,
                  onChanged: dropdownCallBack,
                ),
                const StackedLineSyncFusionContent(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCategoryButton('Ingresos'),
                      _buildCategoryButton('Egresos'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _buildCategoryBlocks(),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildCategoryButton(String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
        if (category == 'Ingresos') {
          Data.fetchIngresos();
        } else {
          Data.fetchEgresos();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          color: selectedCategory == category
              ? Color.fromARGB(255, 187, 96, 203)
              : Colors.grey,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCategoryBlocks() {
    List<Map<String, dynamic>> data =
        selectedCategory == 'Ingresos' ? Data.Ingresos : Data.Egresos;

    if (data.isEmpty) {
      return [
        Center(
          child: Text(
            'no data available',
            style: TextStyle(fontSize: 18.0, color: Colors.red),
          ),
        ),
      ];
    }

    List<Widget> rows = [];
    for (int i = 0; i < data.length; i += 2) {
      if (i + 1 < data.length) {
        // Agrega una fila con dos contenedores
        rows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCategoryBlock(data[i].map((k, v) => MapEntry(k.toString(), v.toString()))),
              _buildCategoryBlock(data[i + 1].map((k, v) => MapEntry(k.toString(), v.toString()))),
            ],
          ),
        );
      } else {
        // Si quedó un elemento suelto, agrégalo en una fila
        rows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCategoryBlock(data[i].map((k, v) => MapEntry(k.toString(), v.toString()))),
            ],
          ),
        );
      }
    }
    return rows;
  }

  Widget _buildCategoryBlock(Map<String, String> item) {
    return Container(
      width: 150,
      height: 120,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          )
        ],
        border: Border.all(
          color: Colors.blue,
          width: 2.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item['Titulo'] ?? 'N/A',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            item['Monto'] ?? 'N/A',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}