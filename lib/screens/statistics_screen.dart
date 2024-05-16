import 'package:flutter/material.dart';
import 'package:mycash_front/components/stacked_line_sync_fusion_content.dart';



class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen>{
  String? _dropdownValue;
  @override
  Widget build(BuildContext context){
    void dropdownCallBack(String? selectedValue){
      if (selectedValue is String){
        setState((){
          _dropdownValue = selectedValue;
        });
      }
    }


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         ClipRRect(
          borderRadius:
              BorderRadius.circular(10), // Set border radius for rounding
          child: Container(
            width: double.infinity, // Full width of the screen
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(89, 134, 223, 1),
                  Color.fromRGBO(177, 86, 168, 1)
                ],
              ),
            ),
            child: const Column(
              children: [
                SizedBox(height: 16), // Add spacing
                Text(
                  'Estadísticas',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16), // Add spacing
              ],
            ),
          ),
        ),
        const SizedBox(height: 16), 
        DropdownButton(
          items: const[
            DropdownMenuItem(child: Text("Mensual"), value: "Mensual"),
            DropdownMenuItem(child: Text("Anual"), value: "Anual"),
          ], value: _dropdownValue,onChanged: dropdownCallBack),
        StackedLineSyncFusionContent().build(context),
        
      ],
    );
  }
}


