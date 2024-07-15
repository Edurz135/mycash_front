

import 'package:mycash_front/model/datetime_data.dart';
import 'package:flutter/material.dart';
import 'package:mycash_front/data/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StackedLineSyncFusionContent extends StatelessWidget {
  const StackedLineSyncFusionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Data.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SfCartesianChart(
                series: <CartesianSeries>[
                  StackedLineSeries<DatetimeData, DateTime>(
                    dataSource: Data.resultadosConTiempo,
                    xValueMapper: (DatetimeData data, _) => data.x,
                    yValueMapper: (DatetimeData data, _) => data.ys[0] as num,
                    legendItemText: "Ingresos",
                    groupName: "Ingresos",
                    width: 4,
                  ),
                  StackedLineSeries<DatetimeData, DateTime>(
                    dataSource: Data.resultadosConTiempo,
                    xValueMapper: (DatetimeData data, _) => data.x,
                    yValueMapper: (DatetimeData data, _) => data.ys[1] as num,
                    legendItemText: "Egresos",
                    groupName: "Egresos",
                    width: 4,
                  ),
                ],
                palette: [
                  Colors.green,
                  Colors.red,
                ],
                primaryXAxis: DateTimeAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  intervalType: DateTimeIntervalType.months,
                ),
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  shouldAlwaysShow: true,
                  builder: (data, _, __, ___, index) {
                    DatetimeData d = data as DatetimeData;
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Monto: ${d.ys[index]}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
                title: ChartTitle(
                  text: 'Estadísticas de Ingresos y Egresos',
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                legend: const Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
